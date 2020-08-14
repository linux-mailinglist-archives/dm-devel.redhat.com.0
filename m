Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5649F2445C9
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:21:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-NhPJCVmkNV2o92dBhZ0TyA-1; Fri, 14 Aug 2020 03:21:32 -0400
X-MC-Unique: NhPJCVmkNV2o92dBhZ0TyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B2D7801AC3;
	Fri, 14 Aug 2020 07:21:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F5E5D9E2;
	Fri, 14 Aug 2020 07:21:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3534A4EE15;
	Fri, 14 Aug 2020 07:21:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E7I77G007988 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 03:18:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38CED110C57D; Fri, 14 Aug 2020 07:18:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 337661006182
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:18:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40E3918AE947
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 07:18:04 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-249-8QQHaO16MLKzrutBkGgwcA-1; Fri, 14 Aug 2020 03:17:59 -0400
X-MC-Unique: 8QQHaO16MLKzrutBkGgwcA-1
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1k6Td9-0007vE-5j; Fri, 14 Aug 2020 06:55:59 +0000
Date: Fri, 14 Aug 2020 07:55:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <20200814065559.GA29917@infradead.org>
References: <510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<20200813153623.GA30905@infradead.org>
	<20200813174704.GA6137@redhat.com>
	<20200813184349.GA8191@infradead.org>
	<96aff2d0-5907-f5c9-9164-8fea0d030d95@grimberg.me>
MIME-Version: 1.0
In-Reply-To: <96aff2d0-5907-f5c9-9164-8fea0d030d95@grimberg.me>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 13, 2020 at 11:53:14PM -0700, Sagi Grimberg wrote:
> > +	switch (nvme_req_disposition(req)) {
> > +	case COMPLETE:
> > +		nvme_complete_req(req);
> 
> nvme_complete_rq calling nvme_complete_req... Maybe call it
> __nvme_complete_rq instead?

That's what I had first, but it felt so strangely out of place next
to the other nvme_*_req calls..

Maybe nvme_complete_rq needs to be renamed - what about nvme_req_done?

> Maybe call nvme_req_disposition again locally here to not carry
> the is_ana_status. But not a biggy..

That means it would have to become non-static in scope, limiting
inlining possibilities, etc.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

