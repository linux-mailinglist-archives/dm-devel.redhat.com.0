Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F03031A2346
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 15:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586353513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n2Esqd3l8An3OTD95hXOY6Jll4YaOhwQyvmnQD1cbV8=;
	b=IR0EWGjNY6bBRWvn/73DT0/TT8na/GA7LaeFB6EUSi97cEtsvNYI4Z8ZNBxGmY2Hp+j/9j
	VC+ImpIUOzjAmjLEshmwNqJ/dYaWyl4GdgEnt5SfuLPG2Jbt5pl3M6UJp/KsgA/FNwwQ1V
	SV8Lx9BrfNDKTNOBCvXXkMw4Glg8/HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-tPjp9s5aOVi0iGQRGAceIw-1; Wed, 08 Apr 2020 09:45:10 -0400
X-MC-Unique: tPjp9s5aOVi0iGQRGAceIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6A01922020;
	Wed,  8 Apr 2020 13:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A55C60BF7;
	Wed,  8 Apr 2020 13:45:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3367293A85;
	Wed,  8 Apr 2020 13:45:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038ALR8e028777 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 06:21:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05921108BD7; Wed,  8 Apr 2020 10:21:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01DECF9ADD
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 10:21:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B100A8FF66C
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 10:21:24 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-3eRSdhZ1NbOr6wWa5ORfaQ-1; Wed, 08 Apr 2020 06:21:22 -0400
X-MC-Unique: 3eRSdhZ1NbOr6wWa5ORfaQ-1
Received: from submission (posteo.de [89.146.220.130]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E9C382400FC
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 12:21:20 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 48y0g41vdZz6tmR
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 12:21:20 +0200 (CEST)
To: dm-devel@redhat.com
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <754a4098-9da2-3395-8a9e-f5b7737ed242@posteo.de>
Date: Wed, 8 Apr 2020 12:21:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 038ALR8e028777
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 Apr 2020 09:37:20 -0400
Subject: [dm-devel] alignment enforcement in dm-crypt causes severe problems
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hello devs,

please see issue: 
https://github.com/virtio-win/kvm-guest-drivers-windows/issues/446

Short summary: When using encrypted disks with qemu (using dm-crypt) and 
pass that through LIO/vhost to qemu (via virtio-scsi) the following code 
is hit:

https://elixir.bootlin.com/linux/v5.3.18/source/drivers/md/dm-crypt.c#L1251

I am not familiar with the specification/contract of "bio". So I am not 
sure if the enforced alignment is legitimate.

Under Windows you cannot even initialize a disk because it wants to 
write sector 0 (count = 1) at offset 432.

Could some expert please comment?

Regards Andreas


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

