Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 83A2B155AC8
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 16:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581089739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TF6nFNQYraCAwJxCwjoTq015Uo4F6X6lbvd3HoJ0jJw=;
	b=f7ddOkdhbXtNCR1Fh9ivtdXA/GU5V7E9VeMDY7pLGRzK68lFLM01T7MWcYGLZ4BhtKUkki
	NXMQNSclQwts6UIx3gVCizPZpeP3ollHk5aWCZTNlIorNMNLi2IQIZ6M6v6PAEpK8eVWrQ
	qXrtsPWNDO0dk4IBrZ4ickUr1ubX23M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-JTeeA4KONhmddR5hAw-vjQ-1; Fri, 07 Feb 2020 10:35:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2659102C862;
	Fri,  7 Feb 2020 15:35:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93E465DA7E;
	Fri,  7 Feb 2020 15:35:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A9D018089CD;
	Fri,  7 Feb 2020 15:35:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017FV9xD006947 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 10:31:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B3B2E87B00; Fri,  7 Feb 2020 15:31:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D38B68ECE6;
	Fri,  7 Feb 2020 15:31:06 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 645CD220A24; Fri,  7 Feb 2020 10:31:06 -0500 (EST)
Date: Fri, 7 Feb 2020 10:31:06 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200207153106.GA11998@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-5-vgoyal@redhat.com>
	<20200205183356.GD26711@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200205183356.GD26711@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
	dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH 4/5] dax,
	iomap: Start using dax native zero_page_range()
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
X-MC-Unique: JTeeA4KONhmddR5hAw-vjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 05, 2020 at 10:33:56AM -0800, Christoph Hellwig wrote:
> On Mon, Feb 03, 2020 at 03:00:28PM -0500, Vivek Goyal wrote:
> > +	id = dax_read_lock();
> > +	rc = dax_zero_page_range(dax_dev, pgoff, offset, size);
> > +	dax_read_unlock(id);
> > +	return rc;
> 
> Is there a good reason not to move the locking into dax_zero_page_range?

Thinking more about it. If we keep locking outside, then we don't have
to take lock again when we recurse into dax_zero_page_range() in device
mapper path. IIUC, just taking lock once at top level is enough. If that's
the case then it probably is better to keep locking outside of
dax_zero_page_range().

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

