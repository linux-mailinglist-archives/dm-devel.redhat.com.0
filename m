Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC3DF199B
	for <lists+dm-devel@lfdr.de>; Wed,  6 Nov 2019 16:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573053101;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+FT3a9BigisYBPwyMwgVdPTzaSD2XDKhwgsDCiL6L/g=;
	b=SzZw4P5CUwVJWjqveiY6wy2B8jl9k4c+XREJykC1ajKNwbHgK5M6mceL/Zz844jJMKe2ax
	+TV3KHlcWUS0QPD8mSSAoco8ammPg/LnTgwkoCWLlXSMRKjEp5vwDtmX/nd9sYggu4J6pg
	ttnTezOJPUoSlZ6DPvmd62j0SW7zLsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-9yu08SohMSGuUEnHmTN4lA-1; Wed, 06 Nov 2019 10:11:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13CB9107ACC3;
	Wed,  6 Nov 2019 15:11:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 624C35C1C3;
	Wed,  6 Nov 2019 15:11:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B9F84BB65;
	Wed,  6 Nov 2019 15:11:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA6F8ZYg004054 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Nov 2019 10:08:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9557E600CE; Wed,  6 Nov 2019 15:08:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD510600C4;
	Wed,  6 Nov 2019 15:08:32 +0000 (UTC)
Date: Wed, 6 Nov 2019 10:08:31 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <20191106150831.GA27888@redhat.com>
References: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
	<8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
MIME-Version: 1.0
In-Reply-To: <8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, mpatocka@redhat.com
Subject: Re: [dm-devel] dm-writecache: change config parameters using
	messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 9yu08SohMSGuUEnHmTN4lA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Nov 05 2019 at  4:19pm -0500,
Maged Mokhtar <mmokhtar@petasan.org> wrote:

> Gentle ping please.
>=20
> It could add flexibility in changing cache parameters after device creati=
on.

I'm inclined to _not_ take this type of change.

Why isn't changing the config parameters via table reload viable for
you?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

