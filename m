Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD90725360
	for <lists+dm-devel@lfdr.de>; Wed,  7 Jun 2023 07:33:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686116017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E2hXRsvl6OlWLhRBbQNIhQ7wwj/LTDJp7WOIlYLBL/Q=;
	b=b0KlI6YC5m9zr9Q1CYN/1s6wDQH78DP0vzKtIK4tDpo8n/sn3jQt5OSWRo0AIVXVIL7ptq
	Xm898ouVHqoX6cumqJXpbiyzu2OmoZCjtRvnHr4+VYsPN4BuAO9b8K47WcIX7Lo9o9KQr3
	/hDckxC/w4dICM2yw/80mKYN1dy1YeA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-lSdvh_cEPcW2XcpQBE6FZg-1; Wed, 07 Jun 2023 01:33:35 -0400
X-MC-Unique: lSdvh_cEPcW2XcpQBE6FZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29A93801182;
	Wed,  7 Jun 2023 05:33:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0927AC16044;
	Wed,  7 Jun 2023 05:33:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 29F5119452CA;
	Wed,  7 Jun 2023 05:33:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 53DE619465BA
 for <dm-devel@listman.corp.redhat.com>; Wed,  7 Jun 2023 05:33:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 438B62026D6A; Wed,  7 Jun 2023 05:33:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6AF2026D49
 for <dm-devel@redhat.com>; Wed,  7 Jun 2023 05:33:15 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFCA93C025D7
 for <dm-devel@redhat.com>; Wed,  7 Jun 2023 05:33:14 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-WSW36gM7PDGxmSY_PWAznA-1; Wed, 07 Jun 2023 01:33:13 -0400
X-MC-Unique: WSW36gM7PDGxmSY_PWAznA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id E78C368AA6; Wed,  7 Jun 2023 07:33:08 +0200 (CEST)
Date: Wed, 7 Jun 2023 07:33:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@kernel.org>
Message-ID: <20230607053308.GA20390@lst.de>
References: <20230601072829.1258286-1-hch@lst.de> <ZH9alEbuNxHNwYYe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZH9alEbuNxHNwYYe@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] enforce read-only state at the block layer
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Not sure of a crafty hack to workaround. Hopefully 5 year old lvm2
> remains tightly coupled to kernels of the same vintage and we get
> lucky moving forward.
> 
> So I agree with Linus, worth trying this simple change again and
> seeing if there is fallout. Revert/worry about it again as needed.

I'm actually looking into implementing Linus' suggestion now and
track in the block_device if it has ever been opened for writing.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

