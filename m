Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60F584217
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jul 2022 16:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659019536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xOmxTQRcvIMQfI6X83qWbk0EhKs3ahmWQboT+HBPhwY=;
	b=aMJN/qdC1koIlzd18IqJAFPQSsVidmeXyiy/m02VLwgkut+ptmo9o37Pn89dHHouFP7VxG
	P7LcnlzF+L0knoQgTUi8XY9HAYljw+3xyEsSD8sRrcEqbUHkYuJ3cwNmOVigg02Pxll+pf
	863gPrfb8jaXuEt8QUDjoq0pkCB9vhA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-t71GJkScP02ey2Fu4vSqhg-1; Thu, 28 Jul 2022 10:45:34 -0400
X-MC-Unique: t71GJkScP02ey2Fu4vSqhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39FE01C0014E;
	Thu, 28 Jul 2022 14:45:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB8012026609;
	Thu, 28 Jul 2022 14:45:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 84AE31945DB2;
	Thu, 28 Jul 2022 14:45:28 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA48F1945D85
 for <dm-devel@listman.corp.redhat.com>; Thu, 28 Jul 2022 14:45:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4989C27D95; Thu, 28 Jul 2022 14:45:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0AC6C15D4F
 for <dm-devel@redhat.com>; Thu, 28 Jul 2022 14:45:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE61185A7A4
 for <dm-devel@redhat.com>; Thu, 28 Jul 2022 14:45:26 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-8XAyb6GqMCSVeq9NvmKK9g-1; Thu, 28 Jul 2022 10:45:24 -0400
X-MC-Unique: 8XAyb6GqMCSVeq9NvmKK9g-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6A6F367373; Thu, 28 Jul 2022 16:45:20 +0200 (CEST)
Date: Thu, 28 Jul 2022 16:45:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20220728144520.GA18285@lst.de>
References: <20220718211226.506362-1-tadeusz.struk@linaro.org>
 <YtwM3uHugOOdDQZT@kroah.com> <YuKgW9BCNl8ChT/v@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YuKgW9BCNl8ChT/v@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH 5.10 1/2] block: split bio_kmalloc from
 bio_alloc_bioset
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, stable@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 syzbot+4f441e6ca0fcad141421@syzkaller.appspotmail.com,
 Tadeusz Struk <tadeusz.struk@linaro.org>, Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 28, 2022 at 04:42:35PM +0200, Greg KH wrote:
> > > Link: https://syzkaller.appspot.com/bug?id=a3416231e37024a75f2b95bd95db0d8ce8132a84
> > 
> > Both now queued up, thanks.
> 
> As was just reported, this breaks things all over the place:
> 	https://lore.kernel.org/r/219030d8-3408-cc9d-7aec-1fb14ab891ce@roeck-us.net
> 
> Note, I also had to add lots of fix-up patches on top of these two that
> you missed, so odds are there are other fix-ups that I also missed.
> 
> Please go and test this again, and submit ALL patches that are needed
> after they pass the proper testing and I will be glad to reconsider them
> again.

Why did this even get backported?  It was a cleanup that required a lot
of prep work, and should not by itself fix anything.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

