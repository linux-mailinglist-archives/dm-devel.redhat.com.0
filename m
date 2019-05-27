Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC32B5EF
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 15:01:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF2A83002C60;
	Mon, 27 May 2019 13:01:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EA0860632;
	Mon, 27 May 2019 13:01:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BA8318433A3;
	Mon, 27 May 2019 13:01:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4RD0asQ009863 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 May 2019 09:00:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B84660635; Mon, 27 May 2019 13:00:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92DE96062A;
	Mon, 27 May 2019 13:00:35 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D607307D866;
	Mon, 27 May 2019 13:00:22 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 27 May 2019 07:00:14 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 27 May 2019 14:59:35 +0200
Message-Id: <20190527125942.8366-3-mwilck@suse.com>
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 27 May 2019 13:00:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 27 May 2019 13:00:30 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/9] mpathpersist: add option --batch-file (-f)
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 27 May 2019 13:01:53 +0000 (UTC)

Add the option --batch-file (-f) to mpathpersist. The option argument
is a text file that is parsed line-by-line. Every line of the file is
interpreted as an additional input line for mpathpersist. The initial
"mpathpersist" on each line is optional. The '#' character denotes
a comment. '#' is only recognized after whitespace. Empty lines,
or comment lines, are allowed.

If -f is given, other command line options are parsed as usual and
commands (if any) are run before running the batch file. Inside the
batch file, the option -f is forbidden, and -v is ignored. If a command
fails, the batch processing is not aborted. The return status of
mpathpersist is 0 if all commands succeeded, and the status of the
first failed command otherwise.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/main.c | 204 ++++++++++++++++++++++++++++++++++++--------
 mpathpersist/main.h |   1 +
 2 files changed, 168 insertions(+), 37 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 94e89c13..2e19f29f 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -15,6 +15,7 @@
 #include <pthread.h>
 #include <ctype.h>
 #include <string.h>
+#include <errno.h>
 
 static const char * pr_type_strs[] = {
 	"obsolete [0]",
@@ -59,7 +60,99 @@ void rcu_unregister_thread_memb(void) {}
 
 struct udev *udev;
 
-int main (int argc, char * argv[])
+static int verbose, loglevel, noisy;
+
+static int handle_args(int argc, char * argv[], int line);
+
+static int do_batch_file(const char *batch_fn)
+{
+	char command[] = "mpathpersist";
+	const int ARGV_CHUNK = 2;
+	const char delims[] = " \t\n";
+	size_t len = 0;
+	char *line = NULL;
+	ssize_t n;
+	int nline = 0;
+	int argl = ARGV_CHUNK;
+	FILE *fl;
+	char **argv = calloc(argl, sizeof(*argv));
+	int ret = MPATH_PR_SUCCESS;
+
+	if (argv == NULL)
+		return MPATH_PR_OTHER;
+
+	fl = fopen(batch_fn, "r");
+	if (fl == NULL) {
+		fprintf(stderr, "unable to open %s: %s\n",
+			batch_fn, strerror(errno));
+		free(argv);
+		return MPATH_PR_SYNTAX_ERROR;
+	} else {
+		if (verbose >= 2)
+			fprintf(stderr, "running batch file %s\n",
+				batch_fn);
+	}
+
+	while ((n = getline(&line, &len, fl)) != -1) {
+		char *_token, *token;
+		int argc = 0;
+		int rv;
+
+		nline++;
+		argv[argc++] = command;
+
+		if (line[n-1] == '\n')
+			line[n-1] = '\0';
+		if (verbose >= 3)
+			fprintf(stderr, "processing line %d: %s\n",
+				nline, line);
+
+		for (token = strtok_r(line, delims, &_token);
+		     token != NULL && *token != '#';
+		     token = strtok_r(NULL, delims, &_token)) {
+
+			if (argc >= argl) {
+				int argn = argl + ARGV_CHUNK;
+				char **tmp;
+
+				tmp = realloc(argv, argn * sizeof(*argv));
+				if (tmp == NULL)
+					break;
+				argv = tmp;
+				argl = argn;
+			}
+
+			if (argc == 1 && !strcmp(token, command))
+				continue;
+
+			argv[argc++] = token;
+		}
+
+		if (argc <= 1)
+			continue;
+
+		if (verbose >= 2) {
+			int i;
+
+			fprintf(stderr, "## file %s line %d:", batch_fn, nline);
+			for (i = 0; i < argc; i++)
+				fprintf(stderr, " %s", argv[i]);
+			fprintf(stderr, "\n");
+		}
+
+		optind = 0;
+		rv = handle_args(argc, argv, nline);
+		if (rv != MPATH_PR_SUCCESS)
+			ret = rv;
+	}
+
+	fclose(fl);
+	free(argv);
+	free(line);
+	return ret;
+}
+
+static int handle_args(int argc, char * argv[], int nline)
 {
 	int fd, c, res;
 	const char *device_name = NULL;
@@ -82,51 +175,42 @@ int main (int argc, char * argv[])
 	int prin = 1;
 	int prin_sa = -1;
 	int prout_sa = -1;
-	int verbose = 0;
-	int loglevel = 0;
-	int noisy = 0;
 	int num_transport =0;
+	char *batch_fn = NULL;
 	void *resp = NULL;
 	struct transportid * tmp;
-	struct config *conf;
-
-	if (optind == argc)
-	{
-
-		fprintf (stderr, "No parameter used\n");
-		usage ();
-		exit (1);
-	}
-
-	if (getuid () != 0)
-	{
-		fprintf (stderr, "need to be root\n");
-		exit (1);
-	}
-
-	udev = udev_new();
-	conf = mpath_lib_init();
-	if(!conf) {
-		udev_unref(udev);
-		exit(1);
-	}
+	struct config *conf = multipath_conf;
 
 	memset(transportids, 0, MPATH_MX_TIDS * sizeof(struct transportid));
-	multipath_conf = conf;
 
 	while (1)
 	{
 		int option_index = 0;
 
-		c = getopt_long (argc, argv, "v:Cd:hHioYZK:S:PAT:skrGILcRX:l:",
+		c = getopt_long (argc, argv, "v:Cd:hHioYZK:S:PAT:skrGILcRX:l:f:",
 				long_options, &option_index);
 		if (c == -1)
 			break;
 
 		switch (c)
 		{
+			case 'f':
+				if (nline != 0) {
+					fprintf(stderr,
+						"ERROR: -f option not allowed in batch file\n");
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
+				}
+				if (batch_fn != NULL) {
+					fprintf(stderr,
+						"ERROR: -f option can be used at most once\n");
+					ret = MPATH_PR_SYNTAX_ERROR;
+					goto out;
+				}
+				batch_fn = strdup(optarg);
+				break;
 			case 'v':
-				if (1 != sscanf (optarg, "%d", &loglevel))
+				if (nline == 0 && 1 != sscanf (optarg, "%d", &loglevel))
 				{
 					fprintf (stderr, "bad argument to '--verbose'\n");
 					return MPATH_PR_SYNTAX_ERROR;
@@ -287,11 +371,13 @@ int main (int argc, char * argv[])
 		}
 	}
 
-	/* set verbosity */
-	noisy = (loglevel >= 3) ? 1 : hex;
-	verbose	= (loglevel >= 3)? 3: loglevel;
+	if (nline == 0) {
+		/* set verbosity */
+		noisy = (loglevel >= 3) ? 1 : hex;
+		verbose	= (loglevel >= 3)? 3: loglevel;
+	}
 
-	if ((prout_flag + prin_flag) == 0)
+	if ((prout_flag + prin_flag) == 0 && batch_fn == NULL)
 	{
 		fprintf (stderr, "choose either '--in' or '--out' \n");
 		ret = MPATH_PR_SYNTAX_ERROR;
@@ -341,7 +427,8 @@ int main (int argc, char * argv[])
 	}
 	else
 	{
-		ret = MPATH_PR_SYNTAX_ERROR;
+		if (batch_fn == NULL)
+			ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
 
@@ -487,10 +574,52 @@ int main (int argc, char * argv[])
 	}
 
 out :
-	if (ret == MPATH_PR_SYNTAX_ERROR)
-		usage();
-	mpath_lib_exit(conf);
+	if (ret == MPATH_PR_SYNTAX_ERROR) {
+		free(batch_fn);
+		if (nline == 0)
+			usage();
+		else
+			fprintf(stderr, "syntax error on line %d in batch file\n",
+				nline);
+	} else if (batch_fn != NULL) {
+		int rv = do_batch_file(batch_fn);
+
+		free(batch_fn);
+		ret = ret == 0 ? rv : ret;
+	}
+	return (ret >= 0) ? ret : MPATH_PR_OTHER;
+}
+
+int main(int argc, char *argv[])
+{
+	int ret;
+
+	if (optind == argc)
+	{
+
+		fprintf (stderr, "No parameter used\n");
+		usage ();
+		exit (1);
+	}
+
+	if (getuid () != 0)
+	{
+		fprintf (stderr, "need to be root\n");
+		exit (1);
+	}
+
+	udev = udev_new();
+	multipath_conf = mpath_lib_init();
+	if(!multipath_conf) {
+		udev_unref(udev);
+		exit(1);
+	}
+
+	ret = handle_args(argc, argv, 0);
+
+	mpath_lib_exit(multipath_conf);
 	udev_unref(udev);
+
 	return (ret >= 0) ? ret : MPATH_PR_OTHER;
 }
 
@@ -691,6 +820,7 @@ static void usage(void)
 			"                   4           Informational messages with trace enabled\n"
 			"    --clear|-C                 PR Out: Clear\n"
 			"    --device=DEVICE|-d DEVICE  query or change DEVICE\n"
+			"    --batch-file|-f FILE       run commands from FILE\n"
 			"    --help|-h                  output this usage message\n"
 			"    --hex|-H                   output response in hex\n"
 			"    --in|-i                    request PR In command \n"
diff --git a/mpathpersist/main.h b/mpathpersist/main.h
index beb8a21b..bfbb82e2 100644
--- a/mpathpersist/main.h
+++ b/mpathpersist/main.h
@@ -2,6 +2,7 @@ static struct option long_options[] = {
 	{"verbose", 1, NULL, 'v'},
 	{"clear", 0, NULL, 'C'},
 	{"device", 1, NULL, 'd'},
+	{"batch-file", 1, NULL, 'f' },
 	{"help", 0, NULL, 'h'},
 	{"hex", 0, NULL, 'H'},
 	{"in", 0, NULL, 'i'},
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
