Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 03F3FFE87C
	for <lists+dm-devel@lfdr.de>; Sat, 16 Nov 2019 00:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573859505;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T+9pBxPDz6yvZZrPlDlayKzDWX612cpvdO5oI23j41g=;
	b=Nq+nNsylQ3Sj99HfsCunmxh6H4cznpFHu3/+mvLI9DNbNYTXTFhUpgIWILvSMoDlTfTf/g
	bW61CpW452wjrk1oy5CPwqntjnLyOPfIaaW6JsZYTY7xBaCuOSoajAqRniuN8CBX3zZQQd
	/oeaHNsgWLLi/cCl1dmWfAFGHgRWgMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-cJu6fvH2MSGjdHOnQOIGqw-1; Fri, 15 Nov 2019 18:11:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17B67800052;
	Fri, 15 Nov 2019 23:11:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA67029341;
	Fri, 15 Nov 2019 23:11:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9D2D18089CD;
	Fri, 15 Nov 2019 23:11:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAFNAtAn000979 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 Nov 2019 18:10:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 411076683B; Fri, 15 Nov 2019 23:10:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34CA766835;
	Fri, 15 Nov 2019 23:10:51 +0000 (UTC)
Date: Fri, 15 Nov 2019 18:10:51 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <20191115231050.GA29649@redhat.com>
References: <20191115190525.77efdf6c@canb.auug.org.au>
	<f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
	<20191116094620.497663ab@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20191116094620.497663ab@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Joe Thornber <dm-devel@redhat.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
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
X-MC-Unique: cJu6fvH2MSGjdHOnQOIGqw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Nov 15 2019 at  5:46pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
>=20
> On Fri, 15 Nov 2019 08:17:48 -0800 Randy Dunlap <rdunlap@infradead.org> w=
rote:
> >
> > on i386:
> >=20
> > ld: drivers/md/dm-integrity.o: in function `calculate_device_limits':
> > dm-integrity.c:(.text.unlikely+0x1e9): undefined reference to `__udivdi=
3'
>=20
> Caused by commit
>=20
>   a236c37603bd ("dm integrity: fix excessive alignment of metadata runs")
>=20
> From the device-mapper tree.

Yes, I've pushed a fixed commit, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/=
commit/?h=3Dfor-next&id=3Dd537858ac8aaf4311b51240893add2fc62003b97

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

