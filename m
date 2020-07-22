Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F2EE322A0B0
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 22:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595449402;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=72W8ttlUAH3ZlQArCg7nk1Xj8S31BDidPgFAmfe3IDY=;
	b=iP4ay5/ci/BFaf+rLJXRZX3cQ4znTFskCo5QLG+KnGDx4ad6yTVs6wJB/g2c5xPChuVCh9
	vDTbTHpOsJWQno1EivdJ0+Uf9VmaROYs0k6aix9xpBy04tkH8eclCbrVNryEtH+g4SrdtB
	OS1HGVXtgJpjUTbMI/rD+Peklvsuglk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8--8Njo498PUeGsZKksspcGg-1; Wed, 22 Jul 2020 16:23:20 -0400
X-MC-Unique: -8Njo498PUeGsZKksspcGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219C3800473;
	Wed, 22 Jul 2020 20:23:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 763891992D;
	Wed, 22 Jul 2020 20:23:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8D8A730F4;
	Wed, 22 Jul 2020 20:22:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MK2Agx017204 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 16:02:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD8B01010404; Wed, 22 Jul 2020 20:02:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBBE01001B2C;
	Wed, 22 Jul 2020 20:02:04 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 06MK24xr023113; Wed, 22 Jul 2020 16:02:04 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 06MK240Z023109; Wed, 22 Jul 2020 16:02:04 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 22 Jul 2020 16:02:04 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200722194536.GA28682@redhat.com>
Message-ID: <alpine.LRH.2.02.2007221601140.16826@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2007221444390.6426@file01.intranet.prod.int.rdu2.redhat.com>
	<20200722194536.GA28682@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Marian Csontos <mcsontos@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-integrity: revert adc0daad366b to fix
	recalculation
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 22 Jul 2020, Mike Snitzer wrote:

> On Wed, Jul 22 2020 at  2:46pm -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Hi Mike
> > 
> > Please submit this to Linus and to RHEL-8.
> > 
> > Mikulas
> > 
> > 
> > 
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > The patch adc0daad366b62ca1bce3e2958a40b0b71a8b8b3 broke recalculation on
> > dm-integrity. The patch replaces a private variable "suspending" with a
> > call to "dm_suspended".
> > 
> > The problem is that dm_suspended returns true not only during suspend, but
> > also during resume. This race condition could occur:
> > 1. dm_integrity_resume calls queue_work(ic->recalc_wq, &ic->recalc_work)
> > 2. integrity_recalc (&ic->recalc_work) preempts the current thread
> > 3. integrity_recalc calls if (unlikely(dm_suspended(ic->ti))) goto unlock_ret;
> > 4. integrity_recalc exits and no recalculating is done.
> > 
> > In order to fix this race condition, we stop using dm_suspended and start
> > using the variable "suspending" (that is only set during suspend, not
> > during resume).
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: adc0daad366b ("dm: report suspended device during destroy")
> > Cc: stable@vger.kernel.org	# v4.18+
> 
> OK, but why not add a dm_suspending() to DM core?  Could be other
> future targets would like this same info right?  I don't see harm in
> elevating it.
> 
> Mike

Yes - it may be possible to add this.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

