Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26229AB6
	for <lists+dm-devel@lfdr.de>; Fri, 24 May 2019 17:14:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B590C0733FB;
	Fri, 24 May 2019 15:13:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F8B63BB5;
	Fri, 24 May 2019 15:12:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D4145B424;
	Fri, 24 May 2019 15:12:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4OFBEMS018750 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 May 2019 11:11:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BDAB100200A; Fri, 24 May 2019 15:11:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F33510027B6;
	Fri, 24 May 2019 15:11:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7B00C05D419;
	Fri, 24 May 2019 15:10:53 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E45E920862;
	Fri, 24 May 2019 15:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558710653;
	bh=zopj89AbmNwtWW42y3dZXTGDLXuFrFoh7zQwouKI4t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=doYw09DbGdSeHmei8lLRQCT7GF87KapImQYCUrEXxC0Q3j9XS7KWfzTUDhxGggVYO
	SdN4D49/BZ81GVttSStLCSr4cpmAbGOf/DlsBdTp90v781nFKCsNSmfoXw9s/0qPhj
	i7B+AITAFTNiXWUolOyC8nFGnlnXG+AOsz4Tx0S4=
Date: Fri, 24 May 2019 17:10:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrea Gelmini <andrea.gelmini@linux.it>
Message-ID: <20190524151051.GA28270@kroah.com>
References: <8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
	<F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
	<20190521190023.GA68070@glet> <20190521201226.GA23332@lobo>
	<CAK-xaQZ9PCLgzFw0-YJ=Yvou=t0k=Vv-9JY4n3=VD2s=NaYL4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK-xaQZ9PCLgzFw0-YJ=Yvou=t0k=Vv-9JY4n3=VD2s=NaYL4w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 24 May 2019 15:10:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 24 May 2019 15:10:53 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE, SPF_NONE,
	T_DKIMWL_WL_HIGH) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>,
	Michael =?iso-8859-1?B?TGHf?= <bevan@bi-co.net>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>, dm-devel@redhat.com,
	Chris Murphy <lists@colorremedies.com>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Subject: Re: [dm-devel] fstrim discarding too many or wrong blocks on Linux
 5.1, leading to data loss
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 24 May 2019 15:14:00 +0000 (UTC)

On Fri, May 24, 2019 at 05:00:51PM +0200, Andrea Gelmini wrote:
> Hi Mike,
>    I'm doing setup to replicate and test the condition. I see your
> patch is already in the 5.2 dev kernel.
>    I'm going to try with latest git, and see what happens. Anyway,
> don't you this it would be good
>    to have this patch ( 51b86f9a8d1c4bb4e3862ee4b4c5f46072f7520d )
> anyway in the 5.1 stable branch?

It's already in the 5.1 stable queue and will be in the next 5.1 release
in a day or so.

thanks,

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
