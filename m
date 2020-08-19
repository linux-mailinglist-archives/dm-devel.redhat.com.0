Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EDB1924A8EF
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 00:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597875276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vdYnlneaJhwlpadBajBMijR/hJdUHW3pymFUkgoWDew=;
	b=YGZKQ4L6mprwZRCltZ+S7oXutHT2WFeBAwHGMjFRVQx09IAyPg9i5DNCUGqmArvnmocKha
	gbqjV8GZp9R7B7tv7oFy2YIWuB/I4lCLvnJC3AnCbgP1xuzzvG5YBsJnQKdnelm9M2MAs9
	Fy6jbWvBHAUVBbo/IJPYNVaAo2SCT+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-KVZHo9rmPA2m4DoXMke-Yw-1; Wed, 19 Aug 2020 18:14:33 -0400
X-MC-Unique: KVZHo9rmPA2m4DoXMke-Yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59C971DDF7;
	Wed, 19 Aug 2020 22:14:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B28105C1DC;
	Wed, 19 Aug 2020 22:14:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D4B71832FC2;
	Wed, 19 Aug 2020 22:14:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JMDjpG017990 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 18:13:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02BCF60C84; Wed, 19 Aug 2020 22:13:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77CE260BEC;
	Wed, 19 Aug 2020 22:13:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07JMDeRx007118; 
	Wed, 19 Aug 2020 17:13:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07JMDdQd007117;
	Wed, 19 Aug 2020 17:13:39 -0500
Date: Wed, 19 Aug 2020 17:13:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200819221339.GT19233@octiron.msp.redhat.com>
References: <20200819131819.13493-1-mwilck@suse.com>
	<20200819131819.13493-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200819131819.13493-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 84/87] libmultipath: add consistency check
 for alias settings
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 19, 2020 at 03:18:16PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> A typo in a config file, assigning the same alias to multiple WWIDs,
> can cause massive confusion and even data corruption. Check and
> if possible fix the bindings file in such cases.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 265 +++++++++++++++++++++++++++++++++++++++++++
>  libmultipath/alias.h |   3 +
>  multipath/main.c     |   3 +
>  multipathd/main.c    |   3 +
>  4 files changed, 274 insertions(+)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index 0759c4e..df44bdc 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -4,6 +4,7 @@
>   */
>  #include <stdlib.h>
>  #include <errno.h>
> +#include <stdlib.h>
>  #include <unistd.h>
>  #include <string.h>
>  #include <limits.h>
> @@ -17,6 +18,9 @@
>  #include "vector.h"
>  #include "checkers.h"
>  #include "structs.h"
> +#include "config.h"
> +#include "util.h"
> +#include "errno.h"
>  
>  
>  /*
> @@ -438,3 +442,264 @@ get_user_friendly_wwid(const char *alias, char *buff, const char *file)
>  	fclose(f);
>  	return 0;
>  }
> +
> +struct binding {
> +	char *alias;
> +	char *wwid;
> +};
> +
> +static void _free_binding(struct binding *bdg)
> +{
> +	free(bdg->wwid);
> +	free(bdg->alias);
> +	free(bdg);
> +}
> +
> +/*
> + * Perhaps one day we'll implement this more efficiently, thus use
> + * an abstract type.
> + */
> +typedef struct _vector Bindings;
> +
> +static void free_bindings(Bindings *bindings)
> +{
> +	struct binding *bdg;
> +	int i;
> +
> +	vector_foreach_slot(bindings, bdg, i)
> +		_free_binding(bdg);
> +	vector_reset(bindings);
> +}
> +
> +enum {
> +	BINDING_EXISTS,
> +	BINDING_CONFLICT,
> +	BINDING_ADDED,
> +	BINDING_DELETED,
> +	BINDING_NOTFOUND,
> +	BINDING_ERROR,
> +};
> +
> +static int add_binding(Bindings *bindings, const char *alias, const char *wwid)
> +{
> +	struct binding *bdg;
> +	int i, cmp = 0;
> +
> +	/*
> +	 * Keep the bindings array sorted by alias.
> +	 * Optimization: Search backwards, assuming that the bindings file is
> +	 * sorted already.
> +	 */
> +	vector_foreach_slot_backwards(bindings, bdg, i) {
> +		if ((cmp = strcmp(bdg->alias, alias)) <= 0)
> +			break;
> +	}
> +
> +	/* Check for exact match */
> +	if (i >= 0 && cmp == 0)
> +		return strcmp(bdg->wwid, wwid) ?
> +			BINDING_CONFLICT : BINDING_EXISTS;
> +
> +	i++;
> +	bdg = calloc(1, sizeof(*bdg));
> +	if (bdg) {
> +		bdg->wwid = strdup(wwid);
> +		bdg->alias = strdup(alias);
> +		if (bdg->wwid && bdg->alias &&
> +		    vector_insert_slot(bindings, i, bdg))
> +			return BINDING_ADDED;
> +		else
> +			_free_binding(bdg);
> +	}
> +
> +	return BINDING_ERROR;
> +}
> +
> +static int write_bindings_file(const Bindings *bindings, int fd)
> +{
> +	struct binding *bnd;
> +	char line[LINE_MAX];
> +	int i;
> +
> +	if (write(fd, BINDINGS_FILE_HEADER, sizeof(BINDINGS_FILE_HEADER) - 1)
> +	    != sizeof(BINDINGS_FILE_HEADER) - 1)
> +		return -1;
> +
> +	vector_foreach_slot(bindings, bnd, i) {
> +		int len;
> +
> +		len = snprintf(line, sizeof(line), "%s %s\n",
> +			       bnd->alias, bnd->wwid);
> +
> +		if (len < 0 || (size_t)len >= sizeof(line)) {
> +			condlog(1, "%s: line overflow", __func__);
> +			return -1;
> +		}
> +
> +		if (write(fd, line, len) != len)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static int fix_bindings_file(const struct config *conf,
> +			     const Bindings *bindings)
> +{
> +	int rc;
> +	long fd;
> +	char tempname[PATH_MAX];
> +
> +	if (safe_sprintf(tempname, "%s.XXXXXX", conf->bindings_file))
> +		return -1;
> +	if ((fd = mkstemp(tempname)) == -1) {
> +		condlog(1, "%s: mkstemp: %m", __func__);
> +		return -1;
> +	}
> +	pthread_cleanup_push(close_fd, (void*)fd);
> +	rc = write_bindings_file(bindings, fd);
> +	pthread_cleanup_pop(1);
> +	if (rc == -1) {
> +		condlog(1, "failed to write new bindings file %s",
> +			tempname);
> +		unlink(tempname);
> +		return rc;
> +	}
> +	if ((rc = rename(tempname, conf->bindings_file)) == -1)
> +		condlog(0, "%s: rename: %m", __func__);
> +	else
> +		condlog(1, "updated bindings file %s", conf->bindings_file);
> +	return rc;
> +}
> +
> +static int _check_bindings_file(const struct config *conf, FILE *file,
> +				 Bindings *bindings)
> +{
> +	int rc = 0;
> +	unsigned int linenr = 0;
> +	char *line = NULL;
> +	size_t line_len = 0;
> +	ssize_t n;
> +
> +	pthread_cleanup_push(free, line);
> +	while ((n = getline(&line, &line_len, file)) >= 0) {
> +		char *c, *alias, *wwid;
> +		const char *mpe_wwid;
> +
> +		linenr++;
> +		c = strpbrk(line, "#\n\r");
> +		if (c)
> +			*c = '\0';
> +		alias = strtok(line, " \t");
> +		if (!alias) /* blank line */
> +			continue;
> +		wwid = strtok(NULL, " \t");
> +		if (!wwid) {
> +			condlog(1, "invalid line %d in bindings file, missing WWID",
> +				linenr);
> +			continue;
> +		}
> +		c = strtok(NULL, " \t");
> +		if (c)
> +			/* This is non-fatal */
> +			condlog(1, "invalid line %d in bindings file, extra args \"%s\"",
> +				linenr, c);
> +
> +		mpe_wwid = get_mpe_wwid(conf->mptable, alias);
> +		if (mpe_wwid && strcmp(mpe_wwid, wwid)) {
> +			condlog(0, "ERROR: alias \"%s\" for WWID %s in bindings file "
> +				"on line %u conflicts with multipath.conf entry for %s",
> +				alias, wwid, linenr, mpe_wwid);
> +			rc = -1;
> +			continue;
> +		}
> +
> +		switch (add_binding(bindings, alias, wwid)) {
> +		case BINDING_CONFLICT:
> +			condlog(0, "ERROR: multiple bindings for alias \"%s\" in "
> +				"bindings file on line %u, discarding binding to WWID %s",
> +				alias, linenr, wwid);
> +			rc = -1;
> +			break;
> +		case BINDING_EXISTS:
> +			condlog(2, "duplicate line for alias %s in bindings file on line %u",
> +				alias, linenr);
> +			break;
> +		case BINDING_ERROR:
> +			condlog(2, "error adding binding %s -> %s",
> +				alias, wwid);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +	pthread_cleanup_pop(1);
> +	return rc;
> +}
> +
> +static void cleanup_fclose(void *p)
> +{
> +	fclose(p);
> +}
> +
> +/*
> + * check_alias_settings(): test for inconsistent alias configuration
> + *
> + * It's a fatal configuration error if the same alias is assigned to
> + * multiple WWIDs. In the worst case, it can cause data corruption
> + * by mangling devices with different WWIDs into the same multipath map.
> + * This function tests the configuration from multipath.conf and the
> + * bindings file for consistency, drops inconsistent multipath.conf
> + * alias settings, and rewrites the bindings file if necessary, dropping
> + * conflicting lines (if user_friendly_names is on, multipathd will
> + * fill in the deleted lines with a newly generated alias later).
> + * Note that multipath.conf is not rewritten. Use "multipath -T" for that.
> + *
> + * Returns: 0 in case of success, -1 if the configuration was bad
> + * and couldn't be fixed.
> + */
> +int check_alias_settings(const struct config *conf)
> +{
> +	int can_write;
> +	int rc = 0, i, fd;
> +	Bindings bindings = {.allocated = 0, };
> +	struct mpentry *mpe;
> +
> +	pthread_cleanup_push_cast(free_bindings, &bindings);
> +	vector_foreach_slot(conf->mptable, mpe, i) {
> +		if (!mpe->wwid || !mpe->alias)
> +			continue;
> +		if (add_binding(&bindings, mpe->alias, mpe->wwid) ==
> +		    BINDING_CONFLICT) {
> +			condlog(0, "ERROR: alias \"%s\" bound to multiple wwids in multipath.conf, "
> +				"discarding binding to %s",
> +				mpe->alias, mpe->wwid);
> +			free(mpe->alias);
> +			mpe->alias = NULL;
> +		}
> +	}
> +	/* This clears the bindings */
> +	pthread_cleanup_pop(1);
> +
> +	pthread_cleanup_push_cast(free_bindings, &bindings);
> +	fd = open_file(conf->bindings_file, &can_write, BINDINGS_FILE_HEADER);
> +	if (fd != -1) {
> +		FILE *file = fdopen(fd, "r");
> +
> +		if (file != NULL) {
> +			pthread_cleanup_push(cleanup_fclose, file);
> +			rc = _check_bindings_file(conf, file, &bindings);
> +			pthread_cleanup_pop(1);
> +			if (rc == -1 && can_write && !conf->bindings_read_only)
> +				rc = fix_bindings_file(conf, &bindings);
> +			else if (rc == -1)
> +				condlog(0, "ERROR: bad settings in read-only bindings file %s",
> +					conf->bindings_file);
> +		} else {
> +			condlog(1, "failed to fdopen %s: %m",
> +				conf->bindings_file);
> +			close(fd);
> +		}
> +	}
> +	pthread_cleanup_pop(1);
> +	return rc;
> +}
> diff --git a/libmultipath/alias.h b/libmultipath/alias.h
> index 236b3ba..dbc950c 100644
> --- a/libmultipath/alias.h
> +++ b/libmultipath/alias.h
> @@ -10,4 +10,7 @@ char *use_existing_alias (const char *wwid, const char *file,
>  			  const char *alias_old,
>  			  const char *prefix, int bindings_read_only);
>  
> +struct config;
> +int check_alias_settings(const struct config *);
> +
>  #endif /* _ALIAS_H */
> diff --git a/multipath/main.c b/multipath/main.c
> index 9e65070..80bc4b5 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -64,6 +64,7 @@
>  #include "time-util.h"
>  #include "file.h"
>  #include "valid.h"
> +#include "alias.h"
>  
>  int logsink;
>  struct udev *udev;
> @@ -958,6 +959,8 @@ main (int argc, char *argv[])
>  		exit(RTVL_FAIL);
>  	}
>  
> +	check_alias_settings(conf);
> +
>  	if (optind < argc) {
>  		dev = MALLOC(FILE_NAME_SIZE);
>  
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 343ee95..9f12a57 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -63,6 +63,7 @@
>  #include "uevent.h"
>  #include "log.h"
>  #include "uxsock.h"
> +#include "alias.h"
>  
>  #include "mpath_cmd.h"
>  #include "mpath_persist.h"
> @@ -2717,6 +2718,8 @@ reconfigure (struct vectors * vecs)
>  		conf->verbosity = verbosity;
>  	if (bindings_read_only)
>  		conf->bindings_read_only = bindings_read_only;
> +	check_alias_settings(conf);
> +
>  	uxsock_timeout = conf->uxsock_timeout;
>  
>  	old = rcu_dereference(multipath_conf);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

