Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 87FA1245F99
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 10:23:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-72CeLQ2rOYKTEZ9bECqeyg-1; Mon, 17 Aug 2020 04:23:44 -0400
X-MC-Unique: 72CeLQ2rOYKTEZ9bECqeyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1D9E1902EB6;
	Mon, 17 Aug 2020 08:23:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F02E27A1C0;
	Mon, 17 Aug 2020 08:23:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90C8C4EE20;
	Mon, 17 Aug 2020 08:23:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07H8NMnW012491 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 04:23:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFD372022789; Mon, 17 Aug 2020 08:23:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC6C2026F94
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:23:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1BD6102F1E3
	for <dm-devel@redhat.com>; Mon, 17 Aug 2020 08:23:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-208-_NMUIamZMFe_LrmqsmRXfA-1;
	Mon, 17 Aug 2020 04:23:17 -0400
X-MC-Unique: _NMUIamZMFe_LrmqsmRXfA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 39AABAC1C;
	Mon, 17 Aug 2020 08:23:41 +0000 (UTC)
Message-ID: <35379f7fa5ad143f4fc49340783a1549c96d5203.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, bmarzins@redhat.com, Christophe
	Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
Date: Mon, 17 Aug 2020 10:23:15 +0200
In-Reply-To: <b6e1e24f-5695-f29f-ce88-bff2d5e3fac1@huawei.com>
References: <351fa23b-b730-ce22-7e89-24f26a693a6a@huawei.com>
	<b6e1e24f-5695-f29f-ce88-bff2d5e3fac1@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH 2/6] multipathd: adopt static char* arr in
	daemon_status
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2020-08-16 at 09:42 +0800, Zhiqiang Liu wrote:
> We adopt static char* array (demon_status_msg) in daemon_status func,
> so it looks more simpler and easier to expand.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  multipathd/main.c | 30 +++++++++++++++---------------
>  multipathd/main.h |  3 ++-
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 9ec6585..cab1d0d 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -153,24 +153,24 @@ static volatile sig_atomic_t exit_sig;
>  static volatile sig_atomic_t reconfig_sig;
>  static volatile sig_atomic_t log_reset_sig;
> 
> +static const char *demon_status_msg[DAEMON_STATUS_SIZE] = {
> +	[DAEMON_INIT] = "init",
> +	[DAEMON_START] = "startup",
> +	[DAEMON_CONFIGURE] = "configure",
> +	[DAEMON_IDLE] = "idle",
> +	[DAEMON_RUNNING] = "running",
> +	[DAEMON_SHUTDOWN] = "shutdown",
> +};
> +
>  const char *
>  daemon_status(void)
>  {
> -	switch (get_running_state()) {
> -	case DAEMON_INIT:
> -		return "init";
> -	case DAEMON_START:
> -		return "startup";
> -	case DAEMON_CONFIGURE:
> -		return "configure";
> -	case DAEMON_IDLE:
> -		return "idle";
> -	case DAEMON_RUNNING:
> -		return "running";
> -	case DAEMON_SHUTDOWN:
> -		return "shutdown";
> -	}
> -	return NULL;
> +	enum daemon_status status = get_running_state();
> +
> +	if (status < DAEMON_INIT || status >= DAEMON_STATUS_SIZE)
> +		return NULL;

I'd rather use "int" as the type of "status", because (not technically,
but logically), an "enum daemon_status" cannot be outside this range.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

