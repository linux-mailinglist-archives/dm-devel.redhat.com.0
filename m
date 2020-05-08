Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D36DB1CB975
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 23:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588972063;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=obIbctjI1Dn1WcF5tMomxykMfTEkox5+Poywo/t54bw=;
	b=F04+gLBWIPW4CTuhzhrIPOcK2m/p3N4RV3L2/HeURym49A5shuOvZhfEg0ghtVN/xxK/zG
	X8AM5TvweYtJvY7WxuIx+OuT8pLcd+61hA26oSivRqCDRCkmT1lFRDrOm0WfK2UnL9eAn2
	eNbAr98lvqFrV9LOpfiFFhumA18kAOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-KaHJhdzjNGKqPWcaV0GSRw-1; Fri, 08 May 2020 17:07:41 -0400
X-MC-Unique: KaHJhdzjNGKqPWcaV0GSRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E083A107ACCA;
	Fri,  8 May 2020 21:07:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F72760BE1;
	Fri,  8 May 2020 21:07:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 491BF4CA94;
	Fri,  8 May 2020 21:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048L7OD3017868 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 17:07:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 615A3163CF0; Fri,  8 May 2020 21:07:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBCD163CE4
	for <dm-devel@redhat.com>; Fri,  8 May 2020 21:07:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACEE2856FFF
	for <dm-devel@redhat.com>; Fri,  8 May 2020 21:07:21 +0000 (UTC)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-LrS5rqpHM3afHdDfe1GTjg-1; Fri, 08 May 2020 17:07:18 -0400
X-MC-Unique: LrS5rqpHM3afHdDfe1GTjg-1
Received: from [81.153.126.158] (helo=[192.168.1.118])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>) id 1jXADE-0009I9-BW
	for dm-devel@redhat.com; Fri, 08 May 2020 22:07:16 +0100
To: dm-devel@redhat.com
From: Wols Lists <antlists@youngman.org.uk>
X-Enigmail-Draft-Status: N1110
Message-ID: <5EB5CA03.9000006@youngman.org.uk>
Date: Fri, 8 May 2020 22:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: [dm-devel] Setting up dm-integrity for raid
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's a bit quiet in here, isn't it? :-)

I'm building a system (which I plan to document for the linux raid
wiki), and I'm wondering what to do. Unfortunately, "man
integritysetup", like so much documentation, is clear as mud to a newbie.

I've currently got /dev/sdb3 formatting away. Will this make a device
appear in /dev? Do I need to do an "integritysetup open" to create the
device so I can pass it to "mdadm --create"? Will that device survive a
reboot, or do I need to put the open command in my startup so that mdadm
can find it?

I guess I will need to sort out adding stuff to mdadm, so that it can
sort it all out for itself, but at the moment it's a case of "as soon as
someone explains it to me, the documentation will become crystal clear" :-)

Cheers,
Wol

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

