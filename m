Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1696B271E6F
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 10:57:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-0EMODMMgNBChNtwSyA7QXg-1; Mon, 21 Sep 2020 04:57:18 -0400
X-MC-Unique: 0EMODMMgNBChNtwSyA7QXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BBEF1084C95;
	Mon, 21 Sep 2020 08:57:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2542F7366A;
	Mon, 21 Sep 2020 08:57:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0224B8C7AD;
	Mon, 21 Sep 2020 08:57:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L8urFr024930 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 04:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C52DD1003332; Mon, 21 Sep 2020 08:56:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0FC31121318
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:56:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ACC718AE95A
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 08:56:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-338-d3xIYtWzO36w32_V5pi8Zg-1;
	Mon, 21 Sep 2020 04:56:47 -0400
X-MC-Unique: d3xIYtWzO36w32_V5pi8Zg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7D266AC83;
	Mon, 21 Sep 2020 08:57:22 +0000 (UTC)
Message-ID: <2784ac6e3115342c807fb750ddd72874621db4ca.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Mon, 21 Sep 2020 10:56:45 +0200
In-Reply-To: <39c4b48b-4cc8-062e-c6c8-1207b38f576a@huawei.com>
References: <ae709d8f-64f7-30bc-bd08-fc2398c0c093@huawei.com>
	<39c4b48b-4cc8-062e-c6c8-1207b38f576a@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V6 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list fails in handle_args func
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-19 at 18:28 +0800, lixiaokeng wrote:
> In handle_args func, we donot check whether malloc paramp and
> each paramp->trnptid_list[j] fails before using them, it may
> cause access NULL pointer.
> 
> Here, we add alloc_prout_param_descriptor to allocate and init
> paramp, and we add free_prout_param_descriptor to free paramp
> and each paramp->trnptid_list[j].
> 
> We change num_transport to num_transportids to combine them.
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> ---
>  mpathpersist/main.c | 64 ++++++++++++++++++++++++++++++++++---------
> --
>  1 file changed, 49 insertions(+), 15 deletions(-)
> 

OK. So your v5 patch wasn't wrong either, as you did set
num_transportids twice. I admit I missed that. But it's better now
anyway. 

Actually, I would have preferred if you solved the issue the other way
around, by moving the assignment to num_transportids to after the
memset() in alloc_prout_param_descriptor(). But it's not worth forcing
you into yet another iteration, so:

Reviewed-by: Martin Wilck <mwilck@suse.com>

This means the whole series (except 8/14 which had been taken back) is
acked now, and I'll push it to the upstream-queue branch.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

