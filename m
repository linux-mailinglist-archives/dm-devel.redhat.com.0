Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BAA617829
	for <lists+dm-devel@lfdr.de>; Thu,  3 Nov 2022 08:57:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667462245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yt+fdpe1q1NMCLLHk859fu+4bAMBb/oz0D/moHR3UW0=;
	b=B5V0ckerMbE7bkz096G1494t7f8L3wlg//rikDqBNoVvFp4rLEFaVn22cyXQ7+OHqAzcdG
	ptVuNLQncOnYbK/VI3Wz3Rx8p1+rxjGRyOwKDE8i4LMyE7nf6Au8zhPvAoT3/VTfdYRafA
	wzSxd+e8gvYS/1tWOSiBfZNm0VLjQp4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-ugsSyZ30PP-6uwsadZhSnw-1; Thu, 03 Nov 2022 03:57:22 -0400
X-MC-Unique: ugsSyZ30PP-6uwsadZhSnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F7173C0F688;
	Thu,  3 Nov 2022 07:57:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E89B4200E1FD;
	Thu,  3 Nov 2022 07:57:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CDC481946A67;
	Thu,  3 Nov 2022 07:57:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F61E1946594
 for <dm-devel@listman.corp.redhat.com>; Wed,  2 Nov 2022 14:52:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B80A1111C60; Wed,  2 Nov 2022 14:52:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33CE21121339
 for <dm-devel@redhat.com>; Wed,  2 Nov 2022 14:52:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1577A8564E0
 for <dm-devel@redhat.com>; Wed,  2 Nov 2022 14:52:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-K2FqJUT_P1qj3PQWq93kSQ-1; Wed, 02 Nov 2022 10:52:23 -0400
X-MC-Unique: K2FqJUT_P1qj3PQWq93kSQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C2C6B822DD;
 Wed,  2 Nov 2022 14:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC94DC433D6;
 Wed,  2 Nov 2022 14:52:17 +0000 (UTC)
Date: Wed, 2 Nov 2022 08:52:15 -0600
From: Keith Busch <kbusch@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y2KEH6OZ0MDf5cSh@kbusch-mbp.dhcp.thefacebook.com>
References: <Y2Hf08vIKBkl5tu0@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <Y2Hf08vIKBkl5tu0@sol.localdomain>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Dmitrii Tcvetkov <me@demsh.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[Cc'ing Dmitrii, who also reported the same issue]

On Tue, Nov 01, 2022 at 08:11:15PM -0700, Eric Biggers wrote:
> Hi,
> 
> I happened to notice the following QEMU bug report:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1290
> 
> I believe it's a regression from the following kernel commit:
> 
>     commit b1a000d3b8ec582da64bb644be633e5a0beffcbf
>     Author: Keith Busch <kbusch@kernel.org>
>     Date:   Fri Jun 10 12:58:29 2022 -0700
> 
>         block: relax direct io memory alignment
> 
> The bug is that if a dm-crypt device is set up with a crypto sector size (and
> thus also a logical_block_size) of 4096, then the block layer now lets through
> direct I/O requests to dm-crypt when the user buffer has only 512-byte
> alignment, instead of the 4096-bytes expected by dm-crypt in that case.  This is
> because the dma_alignment of the device-mapper device is only 511 bytes.
> 
> This has two effects in this case:
> 
>     - The error code for DIO with a misaligned buffer is now EIO, instead of
>       EINVAL as expected and documented.  This is because the I/O reaches
>       dm-crypt instead of being rejected by the block layer.
> 
>     - STATX_DIOALIGN reports 512 bytes for stx_dio_mem_align, instead of the
>       correct value of 4096.  (Technically not a regression since STATX_DIOALIGN
>       is new in v6.1, but still a bug.)
> 
> Any thoughts on what the correct fix is here?  Maybe the device-mapper layer
> needs to set dma_alignment correctly?  Or maybe the block layer needs to set it
> to 'logical_block_size - 1' by default?

I think the quick fix is to have the device mapper override the default
queue stacking limits to align the dma mask to logical block size.

Does dm-crypt strictly require memory alignment to match the block size,
or is this just the way the current software works that we can change?
It may take me a moment to get to the bottem of that, but after a quick
glance, it looks like dm-crypt will work fine with the 512 offsets if we
happen to have a physically contiguous multi-page bvec, and will fail
otherwise due to a predetermined set of sg segments (looking at
crypt_convert_block_aead()).

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

