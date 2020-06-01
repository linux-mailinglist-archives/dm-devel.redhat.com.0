Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 99B401EA78C
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 18:08:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591027732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=glBRXrWU93Tm/YgPIASUSeSaNJbWJfHPvvpDJotqDZE=;
	b=f570WMy000EXvtcYNQ5qdka+p7+dXDh1Ba49f951k0Ks8a/h7gPFU9g2obSnUe/ZNhX4ac
	Yk7roaSICwjlipaUAizUpzHln2aeA10GaUs+iqDBCX2d6hWMcWnZcuJ1yMQnAWhPGWKWgI
	hPNBpnCNr/UV7Zh4EhtBNKDp7xZEGJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-QuZDhauKPluqtzpV5dIAPw-1; Mon, 01 Jun 2020 12:08:50 -0400
X-MC-Unique: QuZDhauKPluqtzpV5dIAPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B4818A8227;
	Mon,  1 Jun 2020 16:08:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3275419C4F;
	Mon,  1 Jun 2020 16:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6EEB938F1;
	Mon,  1 Jun 2020 16:08:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051G4N0v032199 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 12:04:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 853D65D9E7; Mon,  1 Jun 2020 16:04:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C6235D9DD;
	Mon,  1 Jun 2020 16:04:20 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jfmvB-0001Vm-P1; Mon, 01 Jun 2020 18:04:18 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 01 Jun 2020 18:04:17 +0200
Message-Id: <20200601160332.522772720@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 01 Jun 2020 18:03:32 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>, 
	djeffery@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, dm-devel@redhat.com, qat-linux@intel.com,
	jpittman@redhat.com, linux-crypto@vger.kernel.org
Subject: [dm-devel] [PATCH 0/4] Intel QAT fixes
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

These patches fix bugs in the Intel QAT driver.
https://bugzilla.redhat.com/show_bug.cgi?id=1813394

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

