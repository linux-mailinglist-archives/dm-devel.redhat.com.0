Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F255B27B404
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 20:03:55 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601316235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dtVSOh8PETLJam/f6CyMMa6eI4Cn7pkNtlWaELI4uCc=;
	b=BWt/nuU79fyh3w4O6hDhfNuhrSrQaxoM1RyoTJtQy7r7r95+/lp47/nx0uQPUzIElixGdL
	msAp5NZ0rAfqJgTttHEUxB+83ZJ1YcBQou7ZkuPkKfwabUD6otgmSuRBAcn5oNXMdfOypW
	U3K0krwSIBn2GwNHJtQMsn4DgqCQguw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-w0ppwJ0_PLWwjQgvQy5c0g-1; Mon, 28 Sep 2020 14:03:51 -0400
X-MC-Unique: w0ppwJ0_PLWwjQgvQy5c0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7056188C120;
	Mon, 28 Sep 2020 18:03:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F06BF27CC1;
	Mon, 28 Sep 2020 18:03:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7516F18408A1;
	Mon, 28 Sep 2020 18:03:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SI3IL9002587 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 14:03:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B87933782; Mon, 28 Sep 2020 18:03:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53B6755774;
	Mon, 28 Sep 2020 18:03:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08SI3DXD023820; 
	Mon, 28 Sep 2020 13:03:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08SI3CWv023819;
	Mon, 28 Sep 2020 13:03:12 -0500
Date: Mon, 28 Sep 2020 13:03:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200928180312.GM3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-8-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-8-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 07/23] multipathd: move conf destruction into
 separate function
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:38PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Also removing the comment about dlog() and dm_write_log().
> dlog() can cope with get_multipath_config() returning NULL,
> and dm_write_log() hasn't accessed the configuration for a while.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 8b9df55..4d5b40b 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2892,6 +2892,16 @@ set_oom_adj (void)
>  	condlog(0, "couldn't adjust oom score");
>  }
>  
> +static void cleanup_conf(void) {
> +	struct config *conf;
> +
> +	conf = rcu_dereference(multipath_conf);
> +	if (!conf)
> +		return;
> +	rcu_assign_pointer(multipath_conf, NULL);
> +	call_rcu(&conf->rcu, rcu_free_config);
> +}
> +
>  static void cleanup_maps(struct vectors *vecs)
>  {
>  	int queue_without_daemon, i;
> @@ -3194,17 +3204,11 @@ child (__attribute__((unused)) void *param)
>  
>  	condlog(2, "--------shut down-------");
>  
> -	if (logsink == 1)
> +	if (logsink == 1) {
> +		logsink = 0;
>  		log_thread_stop();

It seems like log_thread_stop() could just do something like

pthread_t log_thr_save = log_thr;
log_thr = (pthread_t)0;

at the start, and then you would continue to get syslog logging, even
when the log thread stopped. It's racy, but all the other threads
(except the log_thread, obviously) should be stopped. Or am I not
understanding the purpose of doing this?

> -
> -	/*
> -	 * Freeing config must be done after condlog() and dm_lib_exit(),
> -	 * because logging functions like dlog() and dm_write_log()
> -	 * reference the config.
> -	 */
> -	conf = rcu_dereference(multipath_conf);
> -	rcu_assign_pointer(multipath_conf, NULL);
> -	call_rcu(&conf->rcu, rcu_free_config);
> +	}
> +	cleanup_conf();
>  #ifdef _DEBUG_
>  	dbg_free_final(NULL);
>  #endif
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

