Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 04C7B1B48F0
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 17:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587570096;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=igOPZHqi+pOzVuerFyQLjwO6Q62NKpdn3npUIUZceGY=;
	b=RB17CxgMGsLEdvgHrFJu0BOZ+W9Cc1Z9vUwp1coNOsIpSsuA0BqINYODtyGz7Ch8xy84kt
	M5ihQFFUqET7qqZ2fTDP8mHOTAyckVMawLVYz5lZhgw1eEZcBkp4CglJ61EAd+DWg94G5w
	YtdCnW1Z3SuLDmr1I19K4c3TXvo0l6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ZDQBXXZjPIKxpTFSQt0OeQ-1; Wed, 22 Apr 2020 11:41:33 -0400
X-MC-Unique: ZDQBXXZjPIKxpTFSQt0OeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846CD83DB3A;
	Wed, 22 Apr 2020 15:41:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADF8F614C0;
	Wed, 22 Apr 2020 15:41:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 590B01809541;
	Wed, 22 Apr 2020 15:41:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MFeZaL016753 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 11:40:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9E6F100892C; Wed, 22 Apr 2020 15:40:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5772110F0DE
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 15:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 821CA802071
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 15:40:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-314-CelLse1XMtSH5tX3GPHNSA-1;
	Wed, 22 Apr 2020 11:40:27 -0400
X-MC-Unique: CelLse1XMtSH5tX3GPHNSA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E8339ADEB;
	Wed, 22 Apr 2020 15:40:24 +0000 (UTC)
Message-ID: <3dbafeb000d558af21db70816130573106b56a9c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Date: Wed, 22 Apr 2020 17:40:24 +0200
In-Reply-To: <CAJX1YtaKhjLNN56rvwAXh7tOP1Egbo1izmFn3OUEhD4c489E1w@mail.gmail.com>
References: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
	<086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
	<CAJX1YtaKhjLNN56rvwAXh7tOP1Egbo1izmFn3OUEhD4c489E1w@mail.gmail.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MFeZaL016753
X-loop: dm-devel@redhat.com
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, Jinpu, dm-devel@redhat.com,
	Wang <jinpu.wang@cloud.ionos.com>
Subject: Re: [dm-devel] 'multipath add path' returns ok but the path is
 missing in the topology
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-22 at 16:00 +0200, Gioh Kim wrote:
> 
> One question.
> Is it possible for multipathd to generate an event for removing a
> map?
> I am looking into the source code, ev_add_path and some functions
> related to add a path,
> but it looks like it does not generate any event.

I guess you mean an uevent. These events are created by the kernel when
multipath creates or reloads maps. multipathd normally doesn't trigger
the events directly.  But there are some cases where multipathd
basically runs the equivalent of "udevadm trigger -c change" on either
maps or paths. Search the code for "trigger" for details.

There are also device mapper events which are created by the kernel for
certain state changes of dm devices. Again, multipathd only receives
such events.

Regards
Martin




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

