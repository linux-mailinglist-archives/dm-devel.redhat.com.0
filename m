Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED5225C925
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 21:13:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-Qm4EHHWrOaas0hSjVE66Pw-1; Thu, 03 Sep 2020 15:13:31 -0400
X-MC-Unique: Qm4EHHWrOaas0hSjVE66Pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AF81185A0C1;
	Thu,  3 Sep 2020 19:13:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4257678B38;
	Thu,  3 Sep 2020 19:13:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1876779DBD;
	Thu,  3 Sep 2020 19:13:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083JDCfA002964 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 15:13:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4906CF6423; Thu,  3 Sep 2020 19:13:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44728F6420
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 19:13:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E15E0102F1EA
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 19:13:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-87--sGRNe5oMLCrw0xLvwxO-w-1;
	Thu, 03 Sep 2020 15:13:07 -0400
X-MC-Unique: -sGRNe5oMLCrw0xLvwxO-w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1D989AC8C;
	Thu,  3 Sep 2020 19:13:07 +0000 (UTC)
Message-ID: <4a51a6797398562b475e3320220112c2cd0d2186.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 03 Sep 2020 21:13:04 +0200
In-Reply-To: <5edc1c2b-eb21-198b-9880-3be6621496f9@huawei.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<5edc1c2b-eb21-198b-9880-3be6621496f9@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 05/14] multipathd: use MALLOC and check
 return value in, cli_getprkey func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-02 at 15:18 +0800, lixiaokeng wrote:
> In cli_getprkey func, we use MALLOC instead of malloc, and check
> the return value of MALLOC.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  multipathd/cli_handlers.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
> index 27e4574f..d345afd3 100644
> --- a/multipathd/cli_handlers.c
> +++ b/multipathd/cli_handlers.c
> @@ -1535,7 +1535,11 @@ cli_getprkey(void * v, char ** reply, int *
> len, void * data)
>  	if (!mpp)
>  		return 1;
> 
> -	*reply = malloc(26);
> +	*reply = MALLOC(26);
> +	if (!*reply) {
> +		condlog(0, "malloc *reply failed.");
> +		return 1;
> +	}

MALLOC is not necessary (*reply isn't left uninialized), nor is the
error message.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

