Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F1D8B1795A2
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 17:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583340502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UXv+ZZG5VpAdp/VXgFb8LqN05EWL+qxZPZyviSb6J6M=;
	b=b6TTSNuxaKZVkH84CGOVn/uxj78evDMYYFDj+StkQKZEMoX4yPbO2BvH8SEF8tUxvT3FE8
	QePVDPhuFr8rSZFBg4rRLsOHVVnc3o+8SB0RwfVer3wm8GezmUWpKQCTSm5g3sG2FxcCB0
	SyjplOhgJK9hjevL/ILF3olT45JPVhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-d7QpIFLZP36w_L1MxNHcwQ-1; Wed, 04 Mar 2020 11:48:20 -0500
X-MC-Unique: d7QpIFLZP36w_L1MxNHcwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A40C8010EE;
	Wed,  4 Mar 2020 16:48:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9818100194E;
	Wed,  4 Mar 2020 16:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F18D8174D;
	Wed,  4 Mar 2020 16:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024GlXMI023736 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 11:47:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 624DF2102BF5; Wed,  4 Mar 2020 16:47:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4482026D68
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 16:47:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65111800299
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 16:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-92-vxTVYAwUNsWGJPtYbGzuwg-1; Wed, 04 Mar 2020 11:47:28 -0500
X-MC-Unique: vxTVYAwUNsWGJPtYbGzuwg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j9WhJ-0005Qk-3b; Wed, 04 Mar 2020 16:16:37 +0000
Date: Wed, 4 Mar 2020 08:16:37 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Message-ID: <20200304161637.GA16390@infradead.org>
References: <20200228163456.1587-1-vgoyal@redhat.com>
	<20200228163456.1587-2-vgoyal@redhat.com>
	<CAM9Jb+gJWH_bC-9fgGdeP5LaSVjJ3JgTnjBxpRJMfe6vbTPOTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+gJWH_bC-9fgGdeP5LaSVjJ3JgTnjBxpRJMfe6vbTPOTA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 024GlXMI023736
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, david@fromorbit.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com, Christoph Hellwig <hch@lst.de>,
	Vivek Goyal <vgoyal@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Feb 29, 2020 at 09:04:00AM +0100, Pankaj Gupta wrote:
> > +       phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
> 
> minor nit,  maybe 512 is replaced by macro? Looks like its used at multiple
> places, maybe can keep at is for now.

That would be the existing SECTOR_SIZE macro.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

