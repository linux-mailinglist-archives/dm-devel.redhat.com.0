Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B1411140E4A
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 16:50:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579276239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bE5LHd+KnUS224nVYWN0YC+WUwXVMXvEKi30L3ESqQc=;
	b=fSYps5AaYJJMtc6dOZsXTWCZuWfzNJSroJjCaR9+DOVSGS55ZNAgEy6jwrrL3x4weV8oKr
	wwnDfV4Ziq7QyMWiVq2qb0SGfr9QlIKw1aD8T7YPcn54HpAnprOa+jgvgU99OD2Emo1Fpo
	lL2OVeb3gccawcVLGq0sGZi3sqHxJQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-dDKwXNg6MHG1fDriVef6qw-1; Fri, 17 Jan 2020 10:50:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED25DBA6;
	Fri, 17 Jan 2020 15:50:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2145A19C7F;
	Fri, 17 Jan 2020 15:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BC9418089CD;
	Fri, 17 Jan 2020 15:50:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HFoOYi017719 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 10:50:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D285D2026D68; Fri, 17 Jan 2020 15:50:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDEE62024517
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 15:50:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AD8D185AB9B
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 15:50:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-129-n-3205maOmGTsJP7czvTdg-1;
	Fri, 17 Jan 2020 10:50:17 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CFB57B294;
	Fri, 17 Jan 2020 15:50:11 +0000 (UTC)
Message-ID: <9ebecec86512f502230e789bed9f6448b56eb10e.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 16:51:27 +0100
In-Reply-To: <1579227500-17196-2-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-2-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: n-3205maOmGTsJP7czvTdg-1
X-MC-Unique: dDKwXNg6MHG1fDriVef6qw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HFoOYi017719
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/15] multipathd: warn when configuration
 has been changed.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> It would be helpful if multipathd could log a message when
> multipath.conf or files in the config_dir have been written to, both
> so
> that it can be used to send a notification to users, and to help with
> determining after the fact if multipathd was running with an older
> config, when the logs of multipathd's behaviour don't match with the
> current multipath.conf.
> 
> To do this, the multipathd uxlsnr thread now sets up inotify watches
> on
> both /etc/multipath.conf and the config_dir to watch if the files are
> deleted or closed after being opened for writing.  In order to keep
> uxlsnr from polling repeatedly if the multipath.conf or the
> config_dir
> aren't present, it will only set up the watches once per reconfigure.
> However, since multipath.conf is far more likely to be replaced by a
> text editor than modified in place, if it gets removed, multipathd
> will
> immediately try to restart the watch on it (which will succeed if the
> file was simply replaced by a new copy).  This does mean that if
> multipath.conf or the config_dir are actually removed and then later
> re-added, multipathd won't log any more messages for changes until
> the
> next reconfigure. But that seems like a fair trade-off to avoid
> repeatedly polling for files that aren't likely to appear.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.h |   1 +
>  multipathd/main.c     |   1 +
>  multipathd/uxlsnr.c   | 134
> ++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 130 insertions(+), 6 deletions(-)

I know I reviewed this already, but this time I have some more remarks,
mostly style.

> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index ffec3103..e69aa07c 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -188,6 +188,7 @@ struct config {
>  	int find_multipaths_timeout;
>  	int marginal_pathgroups;
>  	unsigned int version[3];
> +	unsigned int sequence_nr;
>  
>  	char * multipath_dir;
>  	char * selector;
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 34a57689..7b364cfe 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2618,6 +2618,7 @@ reconfigure (struct vectors * vecs)
>  	uxsock_timeout = conf->uxsock_timeout;
>  
>  	old = rcu_dereference(multipath_conf);
> +	conf->sequence_nr = old->sequence_nr + 1;
>  	rcu_assign_pointer(multipath_conf, conf);
>  	call_rcu(&old->rcu, rcu_free_config);
>  
> diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
> index bc71679e..92d9a79a 100644
> --- a/multipathd/uxlsnr.c
> +++ b/multipathd/uxlsnr.c
> @@ -23,6 +23,7 @@
>  #include <sys/time.h>
>  #include <signal.h>
>  #include <stdbool.h>
> +#include <sys/inotify.h>
>  #include "checkers.h"
>  #include "memory.h"
>  #include "debug.h"
> @@ -51,6 +52,8 @@ struct client {
>  LIST_HEAD(clients);
>  pthread_mutex_t client_lock = PTHREAD_MUTEX_INITIALIZER;
>  struct pollfd *polls;
> +int notify_fd = -1;
> +char *config_dir;

Nit: please declare these as static, as they are used only in this
file. Also, naming the variable differently, e.g. conf_dir, would
decrease the number of false hits when grepping for the variable name.

>  
>  static bool _socket_client_is_root(int fd);
>  
> @@ -151,6 +154,8 @@ void uxsock_cleanup(void *arg)
>  	long ux_sock = (long)arg;
>  
>  	close(ux_sock);
> +	close(notify_fd);
> +	free(config_dir);
>  
>  	pthread_mutex_lock(&client_lock);
>  	list_for_each_entry_safe(client_loop, client_tmp, &clients,
> node) {
> @@ -162,6 +167,106 @@ void uxsock_cleanup(void *arg)
>  	free_polls();
>  }
>  
> +/* failing to set the watch descriptor is o.k. we just miss a
> warning
> + * message */
> +void reset_watch(int notify_fd, int *wds, unsigned int *sequence_nr)

This function could also be static.

> +{
> +	struct config *conf;
> +	int dir_reset = 0;
> +	int conf_reset = 0;
> +
> +	if (notify_fd == -1)
> +		return;
> +
> +	conf = get_multipath_config();
> +	/* instead of repeatedly try to reset the inotify watch if
> +	 * the config directory or multipath.conf isn't there, just
> +	 * do it once per reconfigure */
> +	if (*sequence_nr != conf->sequence_nr) {
> +		*sequence_nr = conf->sequence_nr;
> +		if (wds[0] == -1)
> +			conf_reset = 1;
> +		if (!config_dir || !conf->config_dir ||
> +		    strcmp(config_dir, conf->config_dir)) {
> +			dir_reset = 1;
> +			if (config_dir)
> +				free(config_dir);
> +			if (conf->config_dir)
> +				config_dir = strdup(conf->config_dir);
> +			else
> +				config_dir = NULL;
> +		} else if (wds[1] == -1)
> +			dir_reset = 1;
> +	}
> +	put_multipath_config(conf);
> +
> +	if (dir_reset) {
> +		if (wds[1] != -1) {
> +			inotify_rm_watch(notify_fd, wds[1]);
> +			wds[1] = -1;
> +		}
> +		if (config_dir) {
> +			wds[1] = inotify_add_watch(notify_fd,
> config_dir,
> +						   IN_CLOSE_WRITE |
> IN_DELETE |
> +						   IN_ONLYDIR);
> +			if (wds[1] == -1)
> +				condlog(3, "didn't set up notifications
> on %s: %s", config_dir, strerror(errno));

Another nitpick: IMO we should be using "%m" for this in new code.

> +		}
> +	}
> +	if (conf_reset) {
> +		wds[0] = inotify_add_watch(notify_fd,
> DEFAULT_CONFIGFILE,
> +					   IN_CLOSE_WRITE);
> +		if (wds[0] == -1)
> +			condlog(3, "didn't set up notifications on
> /etc/multipath.conf: %s", strerror(errno));
> +	}
> +	return;
> +}
> +
> +void handle_inotify(int fd, int  *wds)

Again, static.

> +{
> +	char buff[1024]
> +		__attribute__ ((aligned(__alignof__(struct
> inotify_event))));
> +	const struct inotify_event *event;
> +	ssize_t len;
> +	char *ptr;
> +	int i, got_notify = 0;
> +
> +	for (;;) {
> +		len = read(fd, buff, sizeof(buff));
> +		if (len <= 0) {
> +			if (len < 0 && errno != EAGAIN) {
> +				condlog(3, "error reading from
> inotify_fd");
> +				for (i = 0; i < 2; i++) {
> +					if (wds[i] != -1) {
> +						inotify_rm_watch(fd,
> wds[i]);
> +						wds[i] = -1;
> +					}
> +				}
> +			}
> +			break;
> +		}
> +
> +		got_notify = 1;
> +		for (ptr = buff; ptr < buff + len;
> +		     ptr += sizeof(struct inotify_event) + event->len)
> {
> +			event = (const struct inotify_event *) ptr;
> +
> +			if (event->mask & IN_IGNORED) {
> +				/* multipathd.conf may have been
> overwritten.
> +				 * Try once to reset the notification
> */
> +				if (wds[0] == event->wd)
> +					wds[0] =
> inotify_add_watch(notify_fd,
> +							DEFAULT_CONFIGF
> ILE,
> +							IN_CLOSE_WRITE)
> ;
> +				else if (wds[1] == event->wd)
> +					wds[1] = -1;
> +			}
> +		}
> +	}
> +	if (got_notify)
> +		condlog(1, "Multipath configuration updated.\nReload
> multipathd for changes to take effect");
> +}
> +
>  /*
>   * entry point
>   */
> @@ -173,13 +278,19 @@ void * uxsock_listen(uxsock_trigger_fn
> uxsock_trigger, long ux_sock,
>  	char *reply;
>  	sigset_t mask;
>  	int old_clients = MIN_POLLS;
> +	/* conf->sequence_nr will be 1 when uxsock_listen is first
> called */
> +	unsigned int sequence_nr = 0;
> +	int wds[2] = { -1, -1 };

Style issue: The code might be better readable if we used a struct for
this,

struct watch_descriptors {
	int conf_wd;
	int dir_wd;
};	




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

