Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1842791D4
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 22:15:53 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601064952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gNmoN0tOj594u4TbbpUL9cwnZveYpCl0sGBhHPKG9QY=;
	b=AWTo5XDhguAit9mSPH1a/8Ta1SAt767PdLnYky6sEtVAmk91ca82NyTWPGqqs5dtzqXdmB
	98MP12K7gThPk0mhwPecGaGm3Nk1Bdjz5ZWfOMXP5gkXCr8cn56+0lL1ROve7I82XZ7SwD
	PKLluRIdbJ/RHPd9n7FIzQkeGtwjBDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-0vnUSF76ODWdZ6Lim7Y11A-1; Fri, 25 Sep 2020 16:15:48 -0400
X-MC-Unique: 0vnUSF76ODWdZ6Lim7Y11A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFE591084D74;
	Fri, 25 Sep 2020 20:15:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8136B78818;
	Fri, 25 Sep 2020 20:15:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 774AF44A6A;
	Fri, 25 Sep 2020 20:15:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PKFKhG023282 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 16:15:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E1D05C1DA; Fri, 25 Sep 2020 20:15:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 446D95C1BB;
	Fri, 25 Sep 2020 20:15:13 +0000 (UTC)
Date: Fri, 25 Sep 2020 16:15:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
Message-ID: <20200925201512.GA6025@redhat.com>
References: <20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
	<alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
	<alpine.LRH.2.02.2009241345370.4229@file01.intranet.prod.int.rdu2.redhat.com>
	<fd512a7d-c064-4812-a794-5274c10687db@default>
	<alpine.LRH.2.02.2009241421170.8544@file01.intranet.prod.int.rdu2.redhat.com>
	<eb43742e-bdfe-4567-8240-1d8e083d76a2@default>
	<MWHPR04MB37588DF8C3FFF4BD0C3CD543E7360@MWHPR04MB3758.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR04MB37588DF8C3FFF4BD0C3CD543E7360@MWHPR04MB3758.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
	"ssudhakarp@gmail.com" <ssudhakarp@gmail.com>,
	Martin Petersen <martin.petersen@oracle.com>, mst@redhat.com,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	Eric Biggers <ebiggers@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"agk@redhat.com" <agk@redhat.com>, linux-scsi@vger.kernel.org,
	Shirley Ma <shirley.ma@oracle.com>, Milan Broz <gmazyland@gmail.com>,
	Mike Christie <michael.christie@oracle.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at  9:09pm -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2020/09/25 4:14, Sudhakar Panneerselvam wrote:
> >>
> >> On Thu, 24 Sep 2020, Sudhakar Panneerselvam wrote:
> >>
> >>>> By copying it to a temporary aligned buffer and issuing I/O on this
> >>>> buffer.
> >>>
> >>> I don't like this idea. Because, you need to allocate additional pages
> >>> for the entire I/O size(for the misaligned case, if you think through
> >>
> >> You can break the I/O to smaller pieces. You can use mempool for
> >> pre-allocation of the pages.
> > 
> > Assuming we do this, how is this code simpler(based on your
> > comment below) than the fix in dm-crypt? In fact, this approach 
> > would make the code change look bad in vhost, at the same time
> > having performance penalty. By doing this, we are just moving the 
> > responsibility to other unrelated component.
> 
> Because vhost is at the top of the block-io food chain. Fixing the unaligned
> segments there will ensure that it does not matter what device is under it. It
> will work.

Right, I agree. This should be addressed in vhost-scsi.  And vhost-scsi
probably needs to be interfacing through block core to submit IO that
respects the limits of its underlying block device.

So please lift your proposed dm-crypt changes to vhost-scsi:
https://patchwork.kernel.org/patch/11781207/
https://patchwork.kernel.org/patch/11781053/

Maybe work with vhost-scsi maintainers to see about making the code
reusable in block core; so that any future unaligned application IO is
dealt in other drivers using the same common code.

But I'm not interested in taking these changes into dm-crypt:

NAK

> I am still baffled that the unaligned segments go through in the first place...
> Do we have something missing in the BIO code ?

Cc'ing linux-block, could be.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

