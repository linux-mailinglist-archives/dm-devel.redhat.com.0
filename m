Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927657CAF2
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jul 2022 14:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658408120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CPG4N04HheSb7BuwIDX4SX8VSR/x3AwQxhIef19+G8c=;
	b=AmWLuWA3xcxhbXojcD6C45QpOhu7PFDo/iQdV3jetFDo9UhtX4gOj5YD4SOjG5yu/EhjXm
	wcoWbDgY+prAgAdr/qXqsrNquKD+6dwbWoutf6+AydR2zOaylNTO/TLFzMiNGHfck3deku
	eLZhMOa3DurbDWuBPIhrMQBIXX1Qp5w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-ThaQ_f_XMn2liVhLVRaxIw-1; Thu, 21 Jul 2022 08:55:18 -0400
X-MC-Unique: ThaQ_f_XMn2liVhLVRaxIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9ACB3C0E211;
	Thu, 21 Jul 2022 12:55:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 264811121314;
	Thu, 21 Jul 2022 12:55:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB662194706D;
	Thu, 21 Jul 2022 12:55:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58A8A1947040
 for <dm-devel@listman.corp.redhat.com>; Thu, 21 Jul 2022 12:55:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 49ABB2026985; Thu, 21 Jul 2022 12:55:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4649F2026D64
 for <dm-devel@redhat.com>; Thu, 21 Jul 2022 12:55:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AC128037A9
 for <dm-devel@redhat.com>; Thu, 21 Jul 2022 12:55:05 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-ynIS3rS6NZmrMyx1_gUd9Q-1; Thu, 21 Jul 2022 08:55:03 -0400
X-MC-Unique: ynIS3rS6NZmrMyx1_gUd9Q-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id C80A168AFE; Thu, 21 Jul 2022 14:54:59 +0200 (CEST)
Date: Thu, 21 Jul 2022 14:54:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220721125459.GC20555@lst.de>
References: <1658316391-13472-1-git-send-email-israelr@nvidia.com>
 <1658316391-13472-2-git-send-email-israelr@nvidia.com>
 <Ytj249InQTKdFshA@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <Ytj249InQTKdFshA@sol.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 1/1] block: Add support for setting inline
 encryption key per block device
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
Cc: Jens Axboe <axboe@kernel.dk>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Israel Rukshin <israelr@nvidia.com>, linux-fscrypt@vger.kernel.org,
 Linux-block <linux-block@vger.kernel.org>, dm-devel@redhat.com,
 Nitzan Carmi <nitzanc@nvidia.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 20, 2022 at 11:49:07PM -0700, Eric Biggers wrote:
> On the other hand, I'd personally be fine with saying that this isn't actually
> needed, i.e. that allowing arbitrary overriding of the default key is fine,
> since userspace should just set up the keys properly.  For example, Android
> doesn't need this at all, as it sets up all its keys properly.  But I want to
> make sure that everyone is generally okay with this now, as I personally don't
> see a fundamental difference between this and what the dm-crypt developers had
> rejected *very* forcefully before.  Perhaps it's acceptable now simply because
> it wouldn't be part of dm-crypt; it's a new thing, so it can have new semantics.

I agree with both the dm-crypt maintainer and you on this.  dm-crypt is
a full disk encryption solution and has to provide guarantees, so it
can't let upper layers degrade the cypher.  The block layer support on
the other hand is just a building block an can as long as it is carefully
documented.

> I'm wondering if anyone any thoughts about how to allow data_unit_size >
> logical_block_size with this patch's approach.  I suppose that the ioctl could
> just allow setting it, and the block layer could fail any I/O that isn't
> properly aligned to the data_unit_size.

We could do that, but we'd need to comunicate the limit to the upper
layers both in the kernel an user space.  Effectively this changes the
logical block size for all practical purposes.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

