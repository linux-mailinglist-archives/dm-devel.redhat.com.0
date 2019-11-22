Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B92851077B7
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 19:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574448974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RHtPu9gzd66gmIoTQGxT/xzbpRoP79esMRnQAjJhCQg=;
	b=jUNdGXurfHBuYj/hGMq+Eom2bad/Lei/MYC7RjuXV69fY0hTVzBPtp39BxrrTNMWbdWCxI
	2qeKr6tRn+jkgEiImQ3KesjRh3MsWjE7P+qCjNByoETmVjwv/AxO47Kcdl+mqjZQHmdz3i
	sT07Ek8/nM2yKhIVq7Eco14qTLmE+4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-o-cX21qRM4W8CREnQbWhlw-1; Fri, 22 Nov 2019 13:56:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55BDB18B9FC1;
	Fri, 22 Nov 2019 18:56:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6749060141;
	Fri, 22 Nov 2019 18:56:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E4871809567;
	Fri, 22 Nov 2019 18:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMItY8H027115 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 13:55:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DD34D9F47; Fri, 22 Nov 2019 18:55:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C58726E71F;
	Fri, 22 Nov 2019 18:55:31 +0000 (UTC)
Date: Fri, 22 Nov 2019 18:55:30 +0000
From: Joe Thornber <thornber@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20191122185530.pcrgmb655dkdbdcq@reti>
Mail-Followup-To: JeffleXu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
X-MC-Unique: o-cX21qRM4W8CREnQbWhlw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 22, 2019 at 11:14:15AM +0800, JeffleXu wrote:

> The first question is what's the purpose of data cell? In thin_bio_map(),
> normal bio will be packed as a virtual cell and data cell. I can understa=
nd
> that virtual cell is used to prevent discard bio and non-discard bio
> targeting the same block from being processed at the same time. I find it
> was added in commit =A0=A0=A0 e8088073c9610af017fd47fddd104a2c3afb32e8 (d=
m thin:
> fix race between simultaneous io and discards to same block), but I'm sti=
ll
> confused about the use of data cell.

As you are aware there are two address spaces for the locks.  The 'virtual'=
 one
refers to cells in the logical address space of the thin devices, and the '=
data' one
refers to the underlying data device.  There are certain conditions where w=
e=20
unfortunately need to hold both of these (eg, to prevent a data block being=
 reprovisioned
before an io to it has completed).

> The second question is the impact of virtual cell and data cell on IO
> performance. If $data_block_size is large for example 1G, in multithread =
fio
> test, most bio will be buffered in cell->bios list and then be processed =
by
> worker thread asynchronously, even when there's no discard bio. Thus the
> original parallel IO is processed by worker thread serially now. As the
> number of fio test threads increase, the single worker thread can easily =
get
> CPU 100%, and thus become the bottleneck of the performance since dm-thin
> workqueue is ordered unbound.

Yep, this is a big issue.  Take a look at dm-bio-prison-v2.h, this is the
new interface that we need to move dm-thin across to use (dm-cache already =
uses it).
It allows concurrent holders of a cell (ie, read locks), so we'll be able t=
o remap
much more io without handing it off to a worker thread.  Once this is done =
I want
to add an extra field to cells that will cache the mapping, this way if you=
 acquire a
cell that is already held then you can avoid the expensive btree lookup.  T=
ogether=20
these changes should make a huge difference to the performance.

If you've got some spare coding cycles I'd love some help with this ;)

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

