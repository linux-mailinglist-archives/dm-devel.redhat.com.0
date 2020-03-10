Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 35E1717F745
	for <lists+dm-devel@lfdr.de>; Tue, 10 Mar 2020 13:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583842752;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=393XJKyiatMLMlCSyBpo98jFPQXeNKNeoWh2uYEy3E4=;
	b=d8tAsDYCcvmxxPptgwqW6DYUheaZwn5WFY5ovV5oPMH6rX+kJlN8uGrA3NARoe98i4CcgJ
	m34wKbltrLvRvMhGTQYvezUI4eFRFBhwg9We9xG5inNgMd38EC3+Dankvpp5j4omrNrGt0
	h6BTMZEhzk7zUC6iwU07OS4p0TMbuTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-KcNppJ1aNESdgyQqYVrIbw-1; Tue, 10 Mar 2020 08:19:09 -0400
X-MC-Unique: KcNppJ1aNESdgyQqYVrIbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9964801A32;
	Tue, 10 Mar 2020 12:19:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4757F60304;
	Tue, 10 Mar 2020 12:18:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 434A81832DE7;
	Tue, 10 Mar 2020 12:18:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ACIZpW026448 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Mar 2020 08:18:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9591A272A1; Tue, 10 Mar 2020 12:18:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0D2F27189;
	Tue, 10 Mar 2020 12:18:32 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 5F29D220291; Tue, 10 Mar 2020 08:18:32 -0400 (EDT)
Date: Tue, 10 Mar 2020 08:18:32 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Message-ID: <20200310121832.GA38440@redhat.com>
References: <20200228163456.1587-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200228163456.1587-1-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: jmoyer@redhat.com, david@fromorbit.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v6 0/6] dax/pmem: Provide a dax operation to
 zero page range
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Feb 28, 2020 at 11:34:50AM -0500, Vivek Goyal wrote:
> Hi,
> 
> This is V6 of patches. These patches are also available at.

Hi Dan,

Ping. Does this patch series look fine to you?

Vivek

> 
> Changes since V5:
> 
> - Dan Williams preferred ->zero_page_range() to only accept PAGE_SIZE
>   aligned request and clear poison only on page size aligned zeroing. So
>   I changed it accordingly. 
> 
> - Dropped all the modifications which were required to support arbitrary
>   range zeroing with-in a page.
> 
> - This patch series also fixes the issue where "truncate -s 512 foo.txt"
>   will fail if first sector of file is poisoned. Currently it succeeds
>   and filesystem expectes whole of the filesystem block to be free of
>   poison at the end of the operation.
> 
> Christoph, I have dropped your Reviewed-by tag on 1-2 patches because
> these patches changed substantially. Especially signature of of
> dax zero_page_range() helper.
> 
> Thanks
> Vivek
> 
> Vivek Goyal (6):
>   pmem: Add functions for reading/writing page to/from pmem
>   dax, pmem: Add a dax operation zero_page_range
>   s390,dcssblk,dax: Add dax zero_page_range operation to dcssblk driver
>   dm,dax: Add dax zero_page_range operation
>   dax: Use new dax zero page method for zeroing a page
>   dax,iomap: Add helper dax_iomap_zero() to zero a range
> 
>  drivers/dax/super.c           | 20 ++++++++
>  drivers/md/dm-linear.c        | 18 +++++++
>  drivers/md/dm-log-writes.c    | 17 ++++++
>  drivers/md/dm-stripe.c        | 23 +++++++++
>  drivers/md/dm.c               | 30 +++++++++++
>  drivers/nvdimm/pmem.c         | 97 ++++++++++++++++++++++-------------
>  drivers/s390/block/dcssblk.c  | 15 ++++++
>  fs/dax.c                      | 59 ++++++++++-----------
>  fs/iomap/buffered-io.c        |  9 +---
>  include/linux/dax.h           | 21 +++-----
>  include/linux/device-mapper.h |  3 ++
>  11 files changed, 221 insertions(+), 91 deletions(-)
> 
> -- 
> 2.20.1
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

