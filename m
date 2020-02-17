Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 66B1816196D
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 19:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581962909;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ue70uy4zsAHddY5VR8Ax0NJQ/GBkKDnussykRJLTPSE=;
	b=QD+ilZuC+EbDP/LH8e2na6CF77LQGuTEEkaofvDowqYdNDh/Yu6xxXXaZ16gNVePHGcBmw
	/ipxJyZmrIItBuG0ClC2PcMTglpU3fCrn0H/6s0mrTCC5PZiuWEfujs0fE2qL5790cLjZV
	9rjsdl1RU2UYIFrCtyXLoiUrDKitDww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-022hH7yqORWsC0lvlJMRKg-1; Mon, 17 Feb 2020 13:08:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A9E3189F763;
	Mon, 17 Feb 2020 18:08:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB2A5C241;
	Mon, 17 Feb 2020 18:08:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2DBE35AF0;
	Mon, 17 Feb 2020 18:08:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HI8Aak021894 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:08:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC06D19757; Mon, 17 Feb 2020 18:08:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E649D19C69;
	Mon, 17 Feb 2020 18:08:07 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 770172257D2; Mon, 17 Feb 2020 13:08:07 -0500 (EST)
Date: Mon, 17 Feb 2020 13:08:07 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200217180807.GC24816@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-4-vgoyal@redhat.com>
	<20200217132607.GD14490@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217132607.GD14490@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH v3 3/7] dax,
	pmem: Add a dax operation zero_page_range
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 022hH7yqORWsC0lvlJMRKg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 17, 2020 at 05:26:07AM -0800, Christoph Hellwig wrote:
> > +	int rc;
> > +	struct pmem_device *pmem = dax_get_private(dax_dev);
> > +	struct page *page = ZERO_PAGE(0);
> 
> Nit: I tend to find code easier to read if variable declarations
> with assignments are above those without.

Fixed in V4. 

> 
> Also I don't think we need the page variable here.

Fixed in V4.

> 
> > +	rc = pmem_do_write(pmem, page, 0, offset, len);
> > +	if (rc > 0)
> > +		return -EIO;
> 
> pmem_do_write returns a blk_status_t, so the type of rc and the > check
> seem odd.  But I think pmem_do_write (and pmem_do_read) might be better
> off returning a normal errno anyway.

Now I am using blk_status_to_errno() to convert error in V4.

        rc = pmem_do_write(pmem, ZERO_PAGE(0), 0, offset, len);
        return blk_status_to_errno(rc);

Did not modify pmem_do_read()/pmem_do_write() to return errno as there
is still one caller which expects to return blk_status_t and then that
caller will have to do the converstion.

Having said that, it probably is good idea to clean up functions called
by pmem_do_read()/pmem_do_write() to return errno. I prefer not to take
that work in that patch series as that seems like a nice to have thing
and can be handled in a separate patch series.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

