Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA8724DB53
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 18:38:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-styxfrvbMr606lS4r-J8_w-1; Fri, 21 Aug 2020 12:38:13 -0400
X-MC-Unique: styxfrvbMr606lS4r-J8_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E9281885D93;
	Fri, 21 Aug 2020 16:38:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C6907AED3;
	Fri, 21 Aug 2020 16:38:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 481D6181A050;
	Fri, 21 Aug 2020 16:37:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LBD2YD014814 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 07:13:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FB262157F4A; Fri, 21 Aug 2020 11:13:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39C222157F25
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:13:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06D7A8EDF03
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 11:13:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-47-VUiYCRqbPuedfGRY9al5bw-1;
	Fri, 21 Aug 2020 07:12:57 -0400
X-MC-Unique: VUiYCRqbPuedfGRY9al5bw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DA53BAD04;
	Fri, 21 Aug 2020 11:13:23 +0000 (UTC)
Message-ID: <e5c780b4f6036eeffac94ada4e837972874a3c22.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Date: Fri, 21 Aug 2020 13:12:55 +0200
In-Reply-To: <8e3e5a81-dcd5-b3d5-41c7-2f443b854367@huawei.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
	<8e3e5a81-dcd5-b3d5-41c7-2f443b854367@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 12:37:46 -0400
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH V2 2/5] multipathd: use daemon_status_msg to
 construct sd notify msg in do_sd_notify func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-21 at 18:59 +0800, Zhiqiang Liu wrote:
> sd_notify_status() is very similar with daemon_status(), except
> DAEMON_IDLE and DAEMON_RUNNING state. As suggested by Martin,
> we can create the sd notification string in a dynamic buffer,
> and treat DAEMON_IDLE and DAEMON_RUNNING cases first. Then,
> we can use daemon_status_msg[state] for other cases.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/main.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 62cf4ff4..4ba015bb 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -85,6 +85,7 @@
> 
>  #define FILE_NAME_SIZE 256
>  #define CMDSIZE 160
> +#define MSG_SIZE 64
> 
>  #define LOG_MSG(lvl, verb, pp)					
> \
>  do {								\
> @@ -177,28 +178,12 @@ daemon_status(void)
>   * I love you too, systemd ...
>   */
>  #ifdef USE_SYSTEMD
> -static const char *
> -sd_notify_status(enum daemon_status state)
> -{
> -	switch (state) {
> -	case DAEMON_INIT:
> -		return "STATUS=init";
> -	case DAEMON_START:
> -		return "STATUS=startup";
> -	case DAEMON_CONFIGURE:
> -		return "STATUS=configure";
> -	case DAEMON_IDLE:
> -	case DAEMON_RUNNING:
> -		return "STATUS=up";
> -	case DAEMON_SHUTDOWN:
> -		return "STATUS=shutdown";
> -	}
> -	return NULL;
> -}
> -
>  static void do_sd_notify(enum daemon_status old_state,
>  			 enum daemon_status new_state)
>  {
> +	char notify_msg[MSG_SIZE];
> +	const char prefix[] = "STATUS=";
> +	const char *msg = NULL;
>  	/*
>  	 * Checkerloop switches back and forth between idle and running
> state.
>  	 * No need to tell systemd each time.
> @@ -207,7 +192,18 @@ static void do_sd_notify(enum daemon_status
> old_state,
>  	if ((new_state == DAEMON_IDLE || new_state == DAEMON_RUNNING)
> &&
>  	    (old_state == DAEMON_IDLE || old_state == DAEMON_RUNNING))
>  		return;
> -	sd_notify(0, sd_notify_status(new_state));
> +
> +	if (new_state == DAEMON_IDLE || new_state == DAEMON_RUNNING)
> +		msg = "up";
> +	else
> +		msg = daemon_status_msg[new_state];
> +
> +	if (snprintf(notify_msg, MSG_SIZE, "%s%s", prefix, msg) >=
> MSG_SIZE) {
> +		condlog(2, "len of msg is should be shorter than %d",
> MSG_SIZE);

You can *prove* that this condition can never occur (actually, you'll
never need more than 17 bytes - it's ok to have some head room). The
compiler may force you to check the return value, but it's safe to
write simply

if (!safe_sprintf(notify_msg, "%s%s", prefix, msg))
       sd_notify(0, notify_msg);

No error message is necessary here.

Martin

> +		return;
> +	}
> +
> +	sd_notify(0, notify_msg);
>  }
>  #endif
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

