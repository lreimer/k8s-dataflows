package de.qaware.oss.cloud;

import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "load", mixinStandardHelpOptions = true)
public class LoadCommand implements Runnable {

    @Option(names = {"-f", "--file"}, description = "CSV file to load.")
    String file;

    @Override
    public void run() {
        System.out.printf("Loading CSV %s!\n", file);
    }

}
