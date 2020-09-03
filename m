Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9713725C906
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 20:58:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-uCmefdpePvSAGUZjERvoRQ-1; Thu, 03 Sep 2020 14:58:44 -0400
X-MC-Unique: uCmefdpePvSAGUZjERvoRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3C951DE0A;
	Thu,  3 Sep 2020 18:58:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09BAA19D6C;
	Thu,  3 Sep 2020 18:58:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D9CA1826D2A;
	Thu,  3 Sep 2020 18:58:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083Iw31A001360 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 14:58:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BB662166BA3; Thu,  3 Sep 2020 18:58:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D592166BA4
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 18:58:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1BFB185A78B
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 18:58:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-538-iMafCVvyPRK7zv5QdkNXzg-1;
	Thu, 03 Sep 2020 14:57:58 -0400
X-MC-Unique: iMafCVvyPRK7zv5QdkNXzg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D2FB8AC5E;
	Thu,  3 Sep 2020 18:57:57 +0000 (UTC)
Message-ID: <41d51bddd2de5bf18d50bd39cf356ee769074647.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 03 Sep 2020 20:57:55 +0200
In-Reply-To: <8b45a04b-c851-94ba-fcba-676c03b060e7@huawei.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<8b45a04b-c851-94ba-fcba-676c03b060e7@huawei.com>
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 04/14] multipathd: check MALLOC return value
 in, mpath_pr_event_handler_fn
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-02 at 15:17 +0800, lixiaokeng wrote:
> In  mpath_pr_event_handler_fn, we use MALLOC instead of malloc, and
> check
> the return value of MALLOC.
> 
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  multipathd/main.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 67e9af11..7180d3c1 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -3391,8 +3391,12 @@ void *  mpath_pr_event_handler_fn (void *
> pathp )
>  		goto out;
>  	}
> 
> -	param= malloc(sizeof(struct prout_param_descriptor));
> -	memset(param, 0 , sizeof(struct prout_param_descriptor));
> +	param = (struct prout_param_descriptor *)MALLOC(sizeof(struct
> prout_param_descriptor));
> +	if (!param) {
> +		ret = MPATH_PR_OTHER;
> +		goto out;
> +	}

No need to set the local variable "ret" when you jump to "out". I can
see this is done elsewhere in this function, too. It has been like that
since day 1.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

