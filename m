Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 309E4153835
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580927657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6geEFzJ+yr17LD+4sS5GIBjFRTKTO6UiKxQasxQG2Uk=;
	b=WlYaPurybmq+9TG70TB6gh0rIK1t3uWL94yG3VFs9Ttx8Sa2Xl6yeIxSc70KpbE7AEs9M4
	nj0L7Rln8DyyNAqNCt/Q6EK7gZaQeDaNgdXntSAreBc7ho1lvE0y+wJwt6Y4l7w0Nwcvfl
	HwE7v/V3X4g9oWqoFMczLJX7dbcu5i8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-Iy4lCyaAPNeRSFeJ04CaHA-1; Wed, 05 Feb 2020 13:34:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B05D0108442C;
	Wed,  5 Feb 2020 18:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D9958DC00;
	Wed,  5 Feb 2020 18:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A29485CF2;
	Wed,  5 Feb 2020 18:34:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IY3BO018550 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:34:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 086522038B9A; Wed,  5 Feb 2020 18:34:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0371A2037E43
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:34:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C060980419A
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-219-HFAvm-5hM9moaxRE7R2RSQ-1; Wed, 05 Feb 2020 13:33:57 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1izPUq-0001ds-4s; Wed, 05 Feb 2020 18:33:56 +0000
Date: Wed, 5 Feb 2020 10:33:56 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200205183356.GD26711@infradead.org>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-5-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200203200029.4592-5-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: HFAvm-5hM9moaxRE7R2RSQ-1
X-MC-Unique: Iy4lCyaAPNeRSFeJ04CaHA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015IY3BO018550
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, hch@infradead.org, dan.j.williams@intel.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 03, 2020 at 03:00:28PM -0500, Vivek Goyal wrote:
> +	id = dax_read_lock();
> +	rc = dax_zero_page_range(dax_dev, pgoff, offset, size);
> +	dax_read_unlock(id);
> +	return rc;

Is there a good reason not to move the locking into dax_zero_page_range?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

