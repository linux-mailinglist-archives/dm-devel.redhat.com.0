Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62973FFD6
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jun 2023 17:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687880200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=psa32/A1KGPYYODILTrzxcc4HXmn3lauoiEr2m/wwew=;
	b=ZVmPc6v97NaX+PqTBSpyzulvGcM+B5nHiUrXB2304+4xLjspME+V3SCoQ5/+3VhbPBs5E7
	TXmnVWD0vYwQVjbiGl4ZEPZ/gvgvzzTfZ+V7ISlycVtQq6hFRkfh6hNo3HW4mdkZMKBmzO
	fe7chVhYt0jhg1EW202mMPio5MGXsyQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-zXF5mYs5MCOcPHjAlw7y-g-1; Tue, 27 Jun 2023 11:36:31 -0400
X-MC-Unique: zXF5mYs5MCOcPHjAlw7y-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53945105729C;
	Tue, 27 Jun 2023 15:32:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32C89140EBB8;
	Tue, 27 Jun 2023 15:31:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4D9B219465A3;
	Tue, 27 Jun 2023 15:31:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 46C301946586
 for <dm-devel@listman.corp.redhat.com>; Tue, 27 Jun 2023 15:31:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2692BC09A07; Tue, 27 Jun 2023 15:31:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DD4C00049;
 Tue, 27 Jun 2023 15:31:13 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 00E9F30C045B; Tue, 27 Jun 2023 15:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 F12C73FB76; Tue, 27 Jun 2023 17:31:12 +0200 (CEST)
Date: Tue, 27 Jun 2023 17:31:12 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <1a33ace-57f9-9ef9-b967-d6617ca33089@redhat.com>
Message-ID: <f9e830ef-adf7-4196-a46f-ba4e65cbb54d@redhat.com>
References: <1a33ace-57f9-9ef9-b967-d6617ca33089@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH] block: flush the disk cache on BLKFLSBUF
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
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 dm-devel@redhat.com, Marc Smith <msmith626@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Mon, 26 Jun 2023, Mikulas Patocka wrote:
> 
> > The BLKFLSBUF ioctl doesn't send the flush bio to the block device, thus
> > flushed data may be lurking in the disk cache and they may not be really
> > flushed to the stable storage.
> > 
> > This patch adds the call to blkdev_issue_flush to blkdev_flushbuf.
> 
> Umm, why?  This is an ioctl no one should be using, and we certainly
> should not add new functionality to it.  Can you explain what you're
> trying to do here?

Marc Smith reported a bug where he wrote to the dm-writecache target using 
O_DIRECT, then reset the machine without proper shutdown and the freshly 
written data were lost. It turned out that he didn't use the fsync or 
fdatasync syscall (and dm-writecache makes its metadata persistent on a 
FLUSH bio).

When I was analyzing this issue, it turned out that there is no easy way 
how to send the FLUSH bio to a block device from a command line.

The sync command synchronizes only filesystems, it doesn't flush cache for 
unmounted block devices (do you think that it should flush block devices 
too?).

The "blockdev --flushbufs" command also doesn't send the FLUSH bio, but I 
would expect it to send it. Without sending the FLUSH bio, "blockdev 
--flushbufs" doesn't really guarantee anything.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

