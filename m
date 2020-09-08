Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0D02612A6
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-REdcqjpXMXykp4WEpBVCOg-1; Tue, 08 Sep 2020 10:26:07 -0400
X-MC-Unique: REdcqjpXMXykp4WEpBVCOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5ACC425CD;
	Tue,  8 Sep 2020 14:25:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F29E60C15;
	Tue,  8 Sep 2020 14:25:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7A847A003;
	Tue,  8 Sep 2020 14:25:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088EPLMi027846 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 10:25:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67C63AB404; Tue,  8 Sep 2020 14:25:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 628C7AB5A3
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 14:25:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 033F3856DEC
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 14:25:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-280-M1aXmElmN8Gcz1Sh1-3nTg-1;
	Tue, 08 Sep 2020 10:25:13 -0400
X-MC-Unique: M1aXmElmN8Gcz1Sh1-3nTg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 43252AE24;
	Tue,  8 Sep 2020 14:25:13 +0000 (UTC)
Message-ID: <f13f55dcfdf6a17702c1c4a3b61b6956e68e0b91.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Tue, 08 Sep 2020 16:25:11 +0200
In-Reply-To: <686d0ca6-2bbf-095d-63bc-346ca609061a@huawei.com>
References: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
	<686d0ca6-2bbf-095d-63bc-346ca609061a@huawei.com>
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
Subject: Re: [dm-devel] [PATCH V3 06/14] kpartx: check return value of
 malloc in main func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-08 at 16:49 +0800, lixiaokeng wrote:
> In main func of kpartx.c, we should check return value of
> malloc before using it.
> 
> V1->V2: change malloc to xmalloc
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> ---
>  kpartx/kpartx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
> index 98f6176e..6de3c9c4 100644
> --- a/kpartx/kpartx.c
> +++ b/kpartx/kpartx.c
> @@ -61,6 +61,9 @@ struct pt {
>  int ptct = 0;
>  int udev_sync = 1;
> 
> +extern void *
> +xmalloc (size_t size);
> +

Please don't use "extern". It's misleading, because this function is
defined in the same file. You should actually change xmalloc() to a
static function.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

