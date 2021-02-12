Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DD49431A26A
	for <lists+dm-devel@lfdr.de>; Fri, 12 Feb 2021 17:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613146409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lYEbAeI2b+vdCYiUZyex74EJAHTszYpFiJ/fTpNcj8I=;
	b=T0WO9S86+0LOWNbspmBh49r5XhZzwD9ztFZBjEXQKasUseB5gwNfludengd8WEUQcPHIhx
	5WRqVon5bv2+3JdVCfG2kHJk43P8eJS2JVZ97gu4KZZFP646qLA29fQP5yPOs6oCAx7j5l
	XJ0qxRIqyCGWrU4IGfjJEGl1lXjS4lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-DRkJtHzXPrqdJRmlgVKzuA-1; Fri, 12 Feb 2021 11:13:27 -0500
X-MC-Unique: DRkJtHzXPrqdJRmlgVKzuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46C15107ACE6;
	Fri, 12 Feb 2021 16:13:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4623A1002388;
	Fri, 12 Feb 2021 16:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F35D718095C9;
	Fri, 12 Feb 2021 16:13:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11CGDCIL031671 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Feb 2021 11:13:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2588060C17; Fri, 12 Feb 2021 16:13:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0204360BF1;
	Fri, 12 Feb 2021 16:13:05 +0000 (UTC)
Date: Fri, 12 Feb 2021 11:13:05 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Sergei Shtepa <sergei.shtepa@veeam.com>
Message-ID: <20210212161305.GB19424@redhat.com>
References: <1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com>
	<1612881028-7878-5-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
In-Reply-To: <1612881028-7878-5-git-send-email-sergei.shtepa@veeam.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Damien.LeMoal@wdc.com, pavel.tide@veeam.com, jack@suse.cz,
	corbet@lwn.net, johannes.thumshirn@wdc.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ming.lei@redhat.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, gregkh@linuxfoundation.org, steve@sk2.org,
	koct9i@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v5 4/6] dm: new ioctl DM_DEV_REMAP_CMD
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 09 2021 at  9:30am -0500,
Sergei Shtepa <sergei.shtepa@veeam.com> wrote:

> New ioctl DM_DEV_REMAP_CMD allow to remap bio requests
> from regular block device to dm device.

I really dislike the (ab)use of "REMAP" for this. DM is and always has
been about remapping IO.  Would prefer DM_DEV_INTERPOSE_CMD

Similarly, all places documenting "remap" or variables with "remap"
changed to "interpose".

Also, any chance you'd be open to putting all these interposer specific
changes in dm-interposer.[ch] ?
(the various internal structs for DM core _should_ be available via dm-core.h)

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

