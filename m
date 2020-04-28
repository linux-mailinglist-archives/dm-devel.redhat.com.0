Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8D39F1BCF3D
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 23:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588111106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QWU0ordiQtZI5yfnx322COpUbjL5qmvX0j/ugBbIkS0=;
	b=L5T7tVzE2rwSoQkjWcl0q+hUZFecviqO9TNvIERAIlbAS0zxGWqtWsczlCqzGYbM5i/3o1
	bj4N+EqVppIb0bvgDYKkFC5ECIAgj4he2ah9xeX+oitXeaZNvWD4R01euDfsqhsHSrZHU0
	V28ZQCVrX1/ko8SVIPi7dNWV48bKaUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-NI04Mp2GOHWaWHivSTGS-A-1; Tue, 28 Apr 2020 17:58:23 -0400
X-MC-Unique: NI04Mp2GOHWaWHivSTGS-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3EC2100CCC0;
	Tue, 28 Apr 2020 21:58:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C55B19C4F;
	Tue, 28 Apr 2020 21:58:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11DAF1809542;
	Tue, 28 Apr 2020 21:58:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SLscOa020507 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 17:54:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC4C810DCF42; Tue, 28 Apr 2020 21:54:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C877D10DCF41
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 21:54:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E293D1019CA7
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 21:54:36 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-136-N457x6ABOsiZNT9gJuhNAw-1;
	Tue, 28 Apr 2020 17:54:32 -0400
X-MC-Unique: N457x6ABOsiZNT9gJuhNAw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 45F87ABB2;
	Tue, 28 Apr 2020 21:54:29 +0000 (UTC)
Message-ID: <131c09dab92b10fa261b215ca94bd41655ad330d.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 28 Apr 2020 23:54:30 +0200
In-Reply-To: <CABr-GncoE2_XKUUTD3GPQfeGKAVnZdavpA2_W++tMz7L=1sHow@mail.gmail.com>
References: <20200302222025.21022-1-mwilck@suse.com>
	<CABr-GncoE2_XKUUTD3GPQfeGKAVnZdavpA2_W++tMz7L=1sHow@mail.gmail.com>
User-Agent: Evolution 3.36.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SLscOa020507
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/4] multipath-tools unit test fixups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Christophe,

On Tue, 2020-03-03 at 00:38 +0100, Christophe Varoqui wrote:
> Ben,
> 
> take the time you need for review,
> I'll wait for this patchset before tagging the next version.

did you notice that Ben acked this set on Mar 13th?

https://www.redhat.com/archives/dm-devel/2020-March/msg00044.html

Regards,
Martin

> 
> Best,
> Christophe.
> 
> On Mon, Mar 2, 2020 at 11:20 PM <mwilck@suse.com> wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Hi Christophe, hi Ben,
> > 
> > as announced in my previous post, here's a set of minor fixups for
> > the
> > unit tests. The README.md should have been created long ago. My
> > main
> > issue is that I'd prefer not to have a file under git control that
> > is
> > likely to be customized in every developer's environment and needs
> > to be stashed away before every serious git work.
> > 
> > Martin Wilck (4):
> >   Remove tests/directio_test_dev
> >   tests/Makefile: allow setting DIO_TEST_DEV in the environment
> >   tests/Makefile: add test_clean target
> >   tests: add README.md
> > 
> >  tests/Makefile          | 13 +++++---
> >  tests/README.md         | 72
> > +++++++++++++++++++++++++++++++++++++++++
> >  tests/directio_test_dev |  4 ---
> >  3 files changed, 81 insertions(+), 8 deletions(-)
> >  create mode 100644 tests/README.md
> >  delete mode 100644 tests/directio_test_dev
> > 
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

