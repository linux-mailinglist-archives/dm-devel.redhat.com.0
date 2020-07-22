Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 013C722A080
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 22:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595448466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DuxgdVogwv7BOOm4WvkYyBc7nEWY5+knnoiuZunSgk0=;
	b=UYA0fR3TCasza2CojQYlEgNXUry4V57PS0diQJg4sT+X7Fz/k9mk4HVHgwzvgStFl0ENxK
	YQ/hoxVA7oK3KisgaeZPpdCXWURRSjuj9VoNhEFHXvWte+7zdX/Xx8Xu818JT+8m+ZCczX
	kK12LRlAX/aZipSUFamZjwHibIOz/wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-5X6E7C9aMAukcLLoHnqThQ-1; Wed, 22 Jul 2020 16:07:44 -0400
X-MC-Unique: 5X6E7C9aMAukcLLoHnqThQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58652800471;
	Wed, 22 Jul 2020 20:07:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4669E71D04;
	Wed, 22 Jul 2020 20:07:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2E951809554;
	Wed, 22 Jul 2020 20:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06MJje0U015377 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 15:45:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1540471D04; Wed, 22 Jul 2020 19:45:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FCCF5BAD5;
	Wed, 22 Jul 2020 19:45:37 +0000 (UTC)
Date: Wed, 22 Jul 2020 15:45:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200722194536.GA28682@redhat.com>
References: <alpine.LRH.2.02.2007221444390.6426@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2007221444390.6426@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 22 2020 at  2:46pm -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Hi Mike
> 
> Please submit this to Linus and to RHEL-8.
> 
> Mikulas
> 
> 
> 
> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> The patch adc0daad366b62ca1bce3e2958a40b0b71a8b8b3 broke recalculation on
> dm-integrity. The patch replaces a private variable "suspending" with a
> call to "dm_suspended".
> 
> The problem is that dm_suspended returns true not only during suspend, but
> also during resume. This race condition could occur:
> 1. dm_integrity_resume calls queue_work(ic->recalc_wq, &ic->recalc_work)
> 2. integrity_recalc (&ic->recalc_work) preempts the current thread
> 3. integrity_recalc calls if (unlikely(dm_suspended(ic->ti))) goto unlock_ret;
> 4. integrity_recalc exits and no recalculating is done.
> 
> In order to fix this race condition, we stop using dm_suspended and start
> using the variable "suspending" (that is only set during suspend, not
> during resume).
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: adc0daad366b ("dm: report suspended device during destroy")
> Cc: stable@vger.kernel.org	# v4.18+

OK, but why not add a dm_suspending() to DM core?  Could be other
future targets would like this same info right?  I don't see harm in
elevating it.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

