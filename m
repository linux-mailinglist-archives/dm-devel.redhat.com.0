Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC83E57EF
	for <lists+dm-devel@lfdr.de>; Sat, 26 Oct 2019 03:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572055069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P2vM8TK7/hIFCCx/jXGySFoYw256m2vu6gQQ4a58QUY=;
	b=SlLKWh/Hv06BsG8bjmanJxMID8wbgKsV45+JThuqOgCO2IL4RYA+1nYB0mEjZGSBuoQByI
	XLEZZXl2iDOX8fp+BEwySP4E2zo5ZbxLQHeapAUkHtHS9DL9D0syjjCCqryl9zCDl6grLx
	FhjW+aL+HugTZMB+YmRCsusQj3Lumvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-9sLqQjOaMc2kiH3v7X1uWw-1; Fri, 25 Oct 2019 21:57:46 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB333800D49;
	Sat, 26 Oct 2019 01:57:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13117600D1;
	Sat, 26 Oct 2019 01:57:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C27DE1800B74;
	Sat, 26 Oct 2019 01:57:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9Q1v2EL027129 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 21:57:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9648600D1; Sat, 26 Oct 2019 01:57:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A084600CD;
	Sat, 26 Oct 2019 01:56:58 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DCDA85360;
	Sat, 26 Oct 2019 01:56:57 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 61C6487EA04B9EE3AF02;
	Sat, 26 Oct 2019 09:56:55 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.145) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 26 Oct 2019 09:56:50 +0800
From: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
To: <dmitry.fomichev@wdc.com>, <damien.lemoal@wdc.com>, <snitzer@redhat.com>, 
	<dm-devel@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Message-ID: <203cc4c8-b380-5b2f-c9e7-766b3f031c8c@huawei.com>
Date: Sat, 26 Oct 2019 09:56:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.2
MIME-Version: 1.0
X-Originating-IP: [10.173.220.145]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Sat, 26 Oct 2019 01:56:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Sat, 26 Oct 2019 01:56:57 +0000 (UTC) for IP:'45.249.212.191'
	DOMAIN:'szxga05-in.huawei.com' HELO:'huawei.com'
	FROM:'zhangxiaoxu5@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.191 szxga05-in.huawei.com
	45.249.212.191 szxga05-in.huawei.com <zhangxiaoxu5@huawei.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: [dm-devel] dm-zoned performance degradation after apply
 75d66ffb48efb3 ("dm zoned:, properly handle backing device failure")
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
X-MC-Unique: 9sLqQjOaMc2kiH3v7X1uWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all, when I 'mkfs.ext4' on the dmz device based on 10T smr disk,
it takes more than 10 hours after apply 75d66ffb48efb3 ("dm zoned:
properly handle backing device failure").

After delete the 'check_events' in 'dmz_bdev_is_dying', it just
take less than 12 mins.

I test it based on 4.19 branch.
Must we do the 'check_events' at mapping path, reclaim or metadata I/O?

Thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

