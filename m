Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D6179840
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 19:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583347521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g/lgAyEWqP+lJGH++usr/gOLROX3++l8tWOBdr9Ff+k=;
	b=fR/TsnumzQknSj0JTWH4pRfOUhLK6TovXNF0h42NO9URXrDm++QvUFAk9iarMLM1wDV6S1
	True+FJyiQqtImIqQfeK9pZzI35anRYgDTB7V/4HYCmAUOuXUvFNT1dCldHThJDSpCaLEh
	c+lo80/vxfxSITNpgB4pNHV/9JZlK0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-USeJYM5wOBKLnD5-4bOFhA-1; Wed, 04 Mar 2020 13:45:17 -0500
X-MC-Unique: USeJYM5wOBKLnD5-4bOFhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CE65190B2A0;
	Wed,  4 Mar 2020 18:45:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC30F5D9C9;
	Wed,  4 Mar 2020 18:45:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBB968174D;
	Wed,  4 Mar 2020 18:44:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024Iiita032155 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 13:44:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4EBAF84D90; Wed,  4 Mar 2020 18:44:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B21E49CA3;
	Wed,  4 Mar 2020 18:44:41 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 5286E2257D2; Wed,  4 Mar 2020 13:44:41 -0500 (EST)
Date: Wed, 4 Mar 2020 13:44:41 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Message-ID: <20200304184441.GE21542@redhat.com>
References: <20200228163456.1587-1-vgoyal@redhat.com>
	<20200228163456.1587-2-vgoyal@redhat.com>
	<CAM9Jb+gJWH_bC-9fgGdeP5LaSVjJ3JgTnjBxpRJMfe6vbTPOTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+gJWH_bC-9fgGdeP5LaSVjJ3JgTnjBxpRJMfe6vbTPOTA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, david@fromorbit.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v6 1/6] pmem: Add functions for
 reading/writing page to/from pmem
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Feb 29, 2020 at 09:04:00AM +0100, Pankaj Gupta wrote:
> On Fri, 28 Feb 2020 at 17:35, Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > This splits pmem_do_bvec() into pmem_do_read() and pmem_do_write().
> > pmem_do_write() will be used by pmem zero_page_range() as well. Hence
> > sharing the same code.
> >
> > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  drivers/nvdimm/pmem.c | 86 +++++++++++++++++++++++++------------------
> >  1 file changed, 50 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index 4eae441f86c9..075b11682192 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -136,9 +136,25 @@ static blk_status_t read_pmem(struct page *page, unsigned int off,
> >         return BLK_STS_OK;
> >  }
> >
> > -static blk_status_t pmem_do_bvec(struct pmem_device *pmem, struct page *page,
> > -                       unsigned int len, unsigned int off, unsigned int op,
> > -                       sector_t sector)
> > +static blk_status_t pmem_do_read(struct pmem_device *pmem,
> > +                       struct page *page, unsigned int page_off,
> > +                       sector_t sector, unsigned int len)
> > +{
> > +       blk_status_t rc;
> > +       phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
> 
> minor nit,  maybe 512 is replaced by macro? Looks like its used at multiple
> places, maybe can keep at is for now.

This came from existing code. If I end up spinning this patch series
again, I will replace it with (sector << SECTOR_SHIFT).

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

