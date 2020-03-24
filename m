Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2B54F190406
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 05:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585022408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ifTCjWiWWv843Tpwl0jWlNahtkzksnfQyzSujCPqqMs=;
	b=LMxa0vJoeZcK/SUS2nQh+XIvCBcyJd8W601am2dRxK7RwLqEPbNpKyVFmF9cG1pSVkYuPM
	T3zFU4o1FVCaf+hceDpr1JC7/rJPuXMpHLDj1J6rN6FkYdCRXv2BbJl6zFOB/FxR/JuFOU
	sRP3kT3zQfgzt7bVt7C1PqFiVJyueR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-57jsAHVKMEyjOZlCSO1yew-1; Tue, 24 Mar 2020 00:00:05 -0400
X-MC-Unique: 57jsAHVKMEyjOZlCSO1yew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49F328010EE;
	Tue, 24 Mar 2020 03:59:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C10A95DA81;
	Tue, 24 Mar 2020 03:59:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55BA186380;
	Tue, 24 Mar 2020 03:59:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O3xn7I026045 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 23:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6698010002A9; Tue, 24 Mar 2020 03:59:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B06301001B2B;
	Tue, 24 Mar 2020 03:59:46 +0000 (UTC)
Date: Mon, 23 Mar 2020 23:59:46 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200324035945.GF30700@redhat.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323150352.107826-3-hare@suse.de>
	<CO2PR04MB23435B2F65967957A5055580E7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB23435B2F65967957A5055580E7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Johannes Thumshirn <jth@kernel.org>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: add 'status' and 'message'
	callbacks
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 23 2020 at 11:54pm -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2020/03/24 0:04, Hannes Reinecke wrote:
> > Add callbacks to supply information for 'dmsetup status'
> > and 'dmsetup info', and implement the message 'reclaim'
> > to start the reclaim worker.
> 
> This one is nice ! Can you send it out minus the cache changes ? We can use it
> with unmodified dm-zoned :)

Yeah, I'm kind of stunned dm-zoned's lack of .status went unnoticeed
until now ;)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

