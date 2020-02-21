Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C3D13168961
	for <lists+dm-devel@lfdr.de>; Fri, 21 Feb 2020 22:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582320870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ew457r0aE+LvcsqTqQQDYppIYrBf8maYYnre0Zab8vc=;
	b=EchenJT5Uum3X/VbDadDTh0lH6fyWek79Syif7412bOVkWPFqBMvJF6fuLLyskWhCKMZYY
	ESp6WaZ+EN8/OlM4/gAWCYeyXobmldNiKnx9TkASh77AXofMv9nG9R7ZHYelPGeH5TMz6L
	aJ4RRaNuNpVkoETJlSMEYz7TJ0F568A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-SVZlLws-PZmAOsclEI5JOw-1; Fri, 21 Feb 2020 16:34:11 -0500
X-MC-Unique: SVZlLws-PZmAOsclEI5JOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D961113FC;
	Fri, 21 Feb 2020 21:34:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5129C5DA76;
	Fri, 21 Feb 2020 21:34:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C190860C7;
	Fri, 21 Feb 2020 21:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LLXwGh027274 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 16:33:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72C8287B11; Fri, 21 Feb 2020 21:33:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from segfault.boston.devel.redhat.com
	(segfault.boston.devel.redhat.com [10.19.60.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D83279053D;
	Fri, 21 Feb 2020 21:33:52 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<CAPcyv4j3BPGvrhuVaQZgvZ0i+M+i-Ab0BH+mAjR_aZzu4_kidQ@mail.gmail.com>
	<20200221212449.GG25974@redhat.com>
	<CAPcyv4gBHuTDW1M-3W=0nuH1v3whChb8TAK1aA0gosBSKpkqcg@mail.gmail.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Fri, 21 Feb 2020 16:33:52 -0500
In-Reply-To: <CAPcyv4gBHuTDW1M-3W=0nuH1v3whChb8TAK1aA0gosBSKpkqcg@mail.gmail.com>
	(Dan Williams's message of "Fri, 21 Feb 2020 13:30:56 -0800")
Message-ID: <x49o8tr1v7j.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
	pmem_clear_poison() to accept arbitrary offset and len
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

Dan Williams <dan.j.williams@intel.com> writes:

> Oh you misunderstood my comment, the "move badblocks to filesystem"
> proposal is long term / down the road thing to consider. In the near
> term this unaligned block zeroing facility is an improvement.

I'm not sure I agree.  I'm going to think about it and get back to you.

-Jeff

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

