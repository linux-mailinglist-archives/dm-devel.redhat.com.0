Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 650022CC06D
	for <lists+dm-devel@lfdr.de>; Wed,  2 Dec 2020 16:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606921909;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ulrvlVCfl0yr2Oy3HLxi+3jwsYjqd2YBqcW/kxIRwu8=;
	b=T21or8939XGl3tiT6VUTsDhu2Q+0lsV6b+i2pVPuC5Sw67PSOel7RAQ/fvrWLGg7uKul3v
	2JlJTDJrvVLf6VY6e/w/ERJULq3CfgW3mBBttc3XxhJ+DSTbfDTo54PlvJw+WQrdNToIF9
	fHpTorz/yJQskWPS42P3sY3A26sBFg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-mYQrxQVQMl2oGrrRbKVA0Q-1; Wed, 02 Dec 2020 10:11:46 -0500
X-MC-Unique: mYQrxQVQMl2oGrrRbKVA0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07880805BF6;
	Wed,  2 Dec 2020 15:11:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 574C11A49B;
	Wed,  2 Dec 2020 15:11:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55FA8180954D;
	Wed,  2 Dec 2020 15:11:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2FBHOD025851 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 10:11:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4E5060873; Wed,  2 Dec 2020 15:11:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CC246086F;
	Wed,  2 Dec 2020 15:11:13 +0000 (UTC)
Date: Wed, 2 Dec 2020 10:11:12 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20201202151112.GD20535@redhat.com>
References: <20201201160709.31748-1-snitzer@redhat.com>
	<20201202033855.60882-1-jefflexu@linux.alibaba.com>
	<20201202033855.60882-2-jefflexu@linux.alibaba.com>
	<feb19a02-5ece-505f-e905-86dc84cdb204@linux.alibaba.com>
	<20201202050343.GA20535@redhat.com>
	<7326607a-b687-3989-dee7-cf469ab37ac4@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <7326607a-b687-3989-dee7-cf469ab37ac4@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com
Subject: Re: [dm-devel] dm: use gcd() to fix chunk_sectors limit stacking
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 02 2020 at  2:10am -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> 
> 
> On 12/2/20 1:03 PM, Mike Snitzer wrote:
> > What you've done here is fairly chaotic/disruptive:
> > 1) you emailed a patch out that isn't needed or ideal, I dealt already
> >    staged a DM fix in linux-next for 5.10-rcX, see:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10-rcX&id=f28de262ddf09b635095bdeaf0e07ff507b3c41b
> 
> Then ti->type->io_hints() is still bypassed when type->iterate_devices()
> not defined?

Yes, the stacking of limits really is tightly coupled to device-based
influence.  Hypothetically some DM target that doesn't remap to any data
devices may want to override limits... in practice there isn't a need
for this.  If that changes we can take action to accommodate it.. but I'm
definitely not interested in modifying DM core in this area when there
isn't a demonstrated need.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

