Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id C35AC18B1C2
	for <lists+dm-devel@lfdr.de>; Thu, 19 Mar 2020 11:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584615222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sJH7J0gOKQ/y8SZfAs2/Mc25sPqi89N7KutExrQQcJc=;
	b=cDITYX+oOeStWbwSWJkb6OumvOSkRQDLd4i5QBKkRTtjBRt7/EpZJ4EfVVdx/8iupvj9SW
	BdulYw1ddWkKcIGBRnqnARlgM4c5SXq6uo401QThMcxSViKEHQfXNd3xTUnN3qXYKR/HAp
	u80nsAfgWWbT1UtYAytOB7aAWWgjOm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-fkd8DvpyN8a9yrRfd12QIw-1; Thu, 19 Mar 2020 06:53:40 -0400
X-MC-Unique: fkd8DvpyN8a9yrRfd12QIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84037101FC64;
	Thu, 19 Mar 2020 10:53:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BB031001B2D;
	Thu, 19 Mar 2020 10:53:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29D8094286;
	Thu, 19 Mar 2020 10:53:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02JAr50t031705 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Mar 2020 06:53:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46FA12022EAD; Thu, 19 Mar 2020 10:53:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41DBD2022EA5
	for <dm-devel@redhat.com>; Thu, 19 Mar 2020 10:53:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85F02800260
	for <dm-devel@redhat.com>; Thu, 19 Mar 2020 10:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-294-pa6AWyvDMZOUdb6J22SYZg-1; Thu, 19 Mar 2020 06:53:00 -0400
X-MC-Unique: pa6AWyvDMZOUdb6J22SYZg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jEsPT-0007Vs-O0; Thu, 19 Mar 2020 10:28:19 +0000
Date: Thu, 19 Mar 2020 03:28:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <20200319102819.GA26418@infradead.org>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02JAr50t031705
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	darrick.wong@oracle.com, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag
 for REQ_OP_WRITE_ZEROES
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

On Fri, Mar 13, 2020 at 04:08:58PM +0300, Kirill Tkhai wrote:
> I just don't understand the reason nothing happens :(
> I see newly-sent patches comes fast into block tree.
> But there is only silence... I grepped over Documentation,
> and there is no special rules about block tree. So,
> it looks like standard rules should be applyable.
> 
> Some comments? Some requests for reworking? Some personal reasons to ignore my patches?

I'm still completely opposed to the magic overloading using a flag.
That is just a bad design waiting for trouble to happen.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

