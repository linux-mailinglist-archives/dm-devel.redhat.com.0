Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D28D3248730
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 16:18:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-H3bOOYmCOG6HwZaapGe--g-1; Tue, 18 Aug 2020 10:17:34 -0400
X-MC-Unique: H3bOOYmCOG6HwZaapGe--g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097E7100670A;
	Tue, 18 Aug 2020 14:17:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45182196B6;
	Tue, 18 Aug 2020 14:17:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0438C181A06C;
	Tue, 18 Aug 2020 14:17:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07H8ZlUl014032 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 04:35:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADE20B07AB; Mon, 17 Aug 2020 08:35:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA2DE5AB89
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:35:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82576803DCC
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:35:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-252-0bJ2KiuBMPeduELvpCcgDw-1;
	Mon, 17 Aug 2020 04:35:43 -0400
X-MC-Unique: 0bJ2KiuBMPeduELvpCcgDw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90A3FAEA6;
	Mon, 17 Aug 2020 08:36:06 +0000 (UTC)
Message-ID: <e5de8fe451462738776acb8c4107e729828e87a2.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 10:35:40 +0200
In-Reply-To: <2d7cd13e-d1df-5fc7-9403-1f845faf64d7@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<2d7cd13e-d1df-5fc7-9403-1f845faf64d7@huawei.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 10:17:04 -0400
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 3/6] multipathd: adopt static char* arr in
 sd_notify_status func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 09:44 +0800, Zhiqiang Liu wrote:
> We adopt static char* array (sd_notify_status_msg) in
> sd_notify_status func, so it looks more simpler and easier
> to expand.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/main.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index cab1d0d..a09ccd1 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -177,23 +177,21 @@ daemon_status(void)
>   * I love you too, systemd ...
>   */
>  #ifdef USE_SYSTEMD
> +static const char *sd_notify_status_msg[DAEMON_STATUS_SIZE] = {
> +	[DAEMON_INIT] = "STATUS=init",
> +	[DAEMON_START] = "STATUS=startup",
> +	[DAEMON_CONFIGURE] = "STATUS=configure",
> +	[DAEMON_IDLE] = "STATUS=up",
> +	[DAEMON_RUNNING] = "STATUS=up",
> +	[DAEMON_SHUTDOWN] = "STATUS=shutdown",
> +};
> +

This repetition of "STATUS=" looks clumsy. It's not your fault, because
the current code does the same thing. But if you want to clean this up,
please create the notification string in a dynamic buffer, and use
daemon_status() for those cases where it applies.

Regards
Martin

>  static const char *
>  sd_notify_status(enum daemon_status state)
>  {
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
> +	if (state < DAEMON_INIT || state >= DAEMON_STATUS_SIZE)
> +		return NULL;
> +	return sd_notify_status_msg[state];
>  }
> 
>  static void do_sd_notify(enum daemon_status old_state,


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

