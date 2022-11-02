Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C461782A
	for <lists+dm-devel@lfdr.de>; Thu,  3 Nov 2022 08:57:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667462246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CKuIZtJpRi/Oc+wrV3aVm4y6t7w9GaoL8el950ipRuo=;
	b=GhGntsVEqs4xaHHV7WifjQEQOX1Qx6A/U+F6vXjRU3HZgbPTGNg0fCTA8jueMkf1QuIQ1f
	riab6fuRMv0xzumwgdOHwK/S8j5LwvhcFmeQ3l3KI31u0lsKobKqhXCOxA5xinTvYGHDOP
	vxQCAV7iEULpjdqIsXfLXTsHfWBq9mI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-LJEhQLPwMpeZo8uhZXgeBQ-1; Thu, 03 Nov 2022 03:57:22 -0400
X-MC-Unique: LJEhQLPwMpeZo8uhZXgeBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A000B101E9B0;
	Thu,  3 Nov 2022 07:57:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B07E2166B26;
	Thu,  3 Nov 2022 07:57:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F0ED1946A73;
	Thu,  3 Nov 2022 07:57:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A16441946A7A
 for <dm-devel@listman.corp.redhat.com>; Wed,  2 Nov 2022 18:58:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5FD8FC569CB; Wed,  2 Nov 2022 18:58:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 586BFC15BA5
 for <dm-devel@redhat.com>; Wed,  2 Nov 2022 18:58:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E283185A79C
 for <dm-devel@redhat.com>; Wed,  2 Nov 2022 18:58:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-Iu0-1nSVNGWuOqWXYdCHBg-1; Wed, 02 Nov 2022 14:58:26 -0400
X-MC-Unique: Iu0-1nSVNGWuOqWXYdCHBg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E3806B82416;
 Wed,  2 Nov 2022 18:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F30C433C1;
 Wed,  2 Nov 2022 18:58:22 +0000 (UTC)
Date: Wed, 2 Nov 2022 12:58:19 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <Y2K9y5zfUcn87e09@kbusch-mbp.dhcp.thefacebook.com>
References: <Y2Hf08vIKBkl5tu0@sol.localdomain>
 <alpine.LRH.2.21.2211021434180.2087@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2211021434180.2087@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 03 Nov 2022 07:57:17 +0000
Subject: Re: [dm-devel] Regression: wrong DIO alignment check with dm-crypt
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 02, 2022 at 02:45:10PM -0400, Mikulas Patocka wrote:
> On Tue, 1 Nov 2022, Eric Biggers wrote:
> > Hi,
> > 
> > I happened to notice the following QEMU bug report:
> > 
> > https://gitlab.com/qemu-project/qemu/-/issues/1290
> > 
> > I believe it's a regression from the following kernel commit:
> > 
> >     commit b1a000d3b8ec582da64bb644be633e5a0beffcbf
> >     Author: Keith Busch <kbusch@kernel.org>
> >     Date:   Fri Jun 10 12:58:29 2022 -0700
> > 
> >         block: relax direct io memory alignment
> 
> I suggest to revert this patch.

I hope we can make that option a last resort.
 
> > The bug is that if a dm-crypt device is set up with a crypto sector size (and
> > thus also a logical_block_size) of 4096, then the block layer now lets through
> > direct I/O requests to dm-crypt when the user buffer has only 512-byte
> > alignment, instead of the 4096-bytes expected by dm-crypt in that case.  This is
> > because the dma_alignment of the device-mapper device is only 511 bytes.
> 
> Propagating dma_alignment through the device mapper stack would be hard 
> (because it is not in struct queue_limits). Perhaps we could set 
> dma_alignment to be the equivalent to logical_block_size, if the above 
> patch could not be reverted - but the we would hit the issue again when 
> someone stacks md or other devices over dm.

It looks straight forward to relocate the attribute to the the
queue_limits. If it stacks correctly, then no one would encounter a
problem no matter what md/dm combination you have.

I have something that looks promising, but I'm trying to give it a
thorough test before sending out another incomplete patch. Hopefully
ready by end of the day.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

