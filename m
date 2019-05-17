Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05F22090
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:59:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CE48307D855;
	Fri, 17 May 2019 22:59:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7635D9CD;
	Fri, 17 May 2019 22:59:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00889206D2;
	Fri, 17 May 2019 22:58:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HMvUfh004787 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:57:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 291EE611D9; Fri, 17 May 2019 22:57:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE87611D2;
	Fri, 17 May 2019 22:57:27 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1845B3084249;
	Fri, 17 May 2019 22:57:26 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 17 May 2019 16:57:20 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 18 May 2019 00:56:58 +0200
Message-Id: <20190517225703.16295-3-mwilck@suse.com>
In-Reply-To: <20190517225703.16295-1-mwilck@suse.com>
References: <20190517225703.16295-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Fri, 17 May 2019 22:57:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 17 May 2019 22:57:26 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dbond@redhat.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [RFC PATCH 2/7] mpathpersist: add option --batch-file
	(-f)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 17 May 2019 22:59:08 +0000 (UTC)

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
---
 mpathpersist/main.c | 195 +++++++++++++++++++++++++++++++++++---------
 mpathpersist/main.h |   1 +
 2 files changed, 159 insertions(+), 37 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 94e89c13..c1a6d3c8 100644
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
@@ -82,51 +175,35 @@ int main (int argc, char * argv[])
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
+					fprintf(stderr, "-f option not allowed in batch file\n");
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
@@ -287,11 +364,13 @@ int main (int argc, char * argv[])
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
@@ -341,7 +420,8 @@ int main (int argc, char * argv[])
 	}
 	else
 	{
-		ret = MPATH_PR_SYNTAX_ERROR;
+		if (batch_fn == NULL)
+			ret = MPATH_PR_SYNTAX_ERROR;
 		goto out;
 	}
 
@@ -487,10 +567,51 @@ int main (int argc, char * argv[])
 	}
 
 out :
-	if (ret == MPATH_PR_SYNTAX_ERROR)
-		usage();
-	mpath_lib_exit(conf);
+	if (ret == MPATH_PR_SYNTAX_ERROR) {
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
 
diff --git a/mpathpersist/main.h b/mpathpersist/main.h
index beb8a21b..c5f53f52 100644
--- a/mpathpersist/main.h
+++ b/mpathpersist/main.h
@@ -23,6 +23,7 @@ static struct option long_options[] = {
 	{"reserve", 0, NULL, 'R'},
 	{"transport-id", 1, NULL, 'X'},
 	{"alloc-length", 1, NULL, 'l'},
+	{"batch-file", 1, NULL, 'f' },
 	{NULL, 0, NULL, 0}
 };
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
