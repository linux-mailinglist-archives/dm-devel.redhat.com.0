Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 45C391DC050
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 22:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590007068;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J1zU7+BZ6+2SjrBQ1BlugdW9spatae7WJ8dNFT5imqk=;
	b=R6v80un21VcJ30vtS3NtdnO4bJkpCwKOW4uoLunpgaaY5ANawtB4rD/whxYq8VotzOK1fn
	L4pmwC9/5dp1etXhKSAsxRjk1jO5FIpVimUWXgsonrZ/crzczstPJV3gcbNpSZlhOtfcdX
	BQRKNccMXLRzmXYFsgTBVUXsEIUklKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-vVMz8QI8PFKBhdpxcuGtew-1; Wed, 20 May 2020 16:37:44 -0400
X-MC-Unique: vVMz8QI8PFKBhdpxcuGtew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78C5B800688;
	Wed, 20 May 2020 20:37:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A1C5473B8;
	Wed, 20 May 2020 20:37:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AD3A1809543;
	Wed, 20 May 2020 20:37:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KKbEsG032358 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 16:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 100BC2156A3A; Wed, 20 May 2020 20:37:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 036A42166BA2
	for <dm-devel@redhat.com>; Wed, 20 May 2020 20:37:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F306D8ECB1A
	for <dm-devel@redhat.com>; Wed, 20 May 2020 20:37:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-128-tqdaFp9cNp6Leh3nwRxD_g-1;
	Wed, 20 May 2020 16:37:09 -0400
X-MC-Unique: tqdaFp9cNp6Leh3nwRxD_g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2D4CBC08F;
	Wed, 20 May 2020 20:37:10 +0000 (UTC)
Message-ID: <97355996ab3dfeda13cee42a93f92f3ab54d289a.camel@suse.com>
From: Martin Wilck <martin.wilck@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
In-Reply-To: <fbbd16f6-3564-288e-4180-6322a2b478da@gmail.com>
References: <fbbd16f6-3564-288e-4180-6322a2b478da@gmail.com>
MIME-Version: 1.0
Date: Wed, 20 May 2020 22:36:59 +0200
User-Agent: Evolution 3.36.2
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04KKbEsG032358
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>,
	dm-devel mailing list <dm-devel@redhat.com>
Subject: Re: [dm-devel] multipath-tools: -1patch in upstream-queue
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Xose,

On Wed, 2020-05-20 at 18:56 +0200, Xose Vazquez Perez wrote:
> Hi Martin,
>=20
> The JSON patch send by Christian Hesse(twice) is missed, in your
> upstream-queue:
> https://marc.info/?l=3Ddm-devel&m=3D158792878717348 or
> https://marc.info/?l=3Ddm-devel&m=3D158797224229431
>=20
> Thank you.

Right, I missed that one. Thanks for pointing it out.

However, it has no "Reviewed-by:" tag from anyone, including yourself,
so it couldn't be pushed to upstream-queue yet.

Actually, I don't like fixing this this way. I have no idea why the
json-c people did this, but I'd rather fall back to stdbool.h than to 0
and 1.

I'm going to send a modified verson.

Regards
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

