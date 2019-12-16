Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8229112021C
	for <lists+dm-devel@lfdr.de>; Mon, 16 Dec 2019 11:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576491426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z1woxj+T6m2k4yvp2DZ25Nskd2JmXSTJ2OHMDiZewbE=;
	b=Symbwe8mUT2zctqVDHsjFXVDIlgaCDLVabgJ/vmzsNn3lzCvKD4frLV+4q3LGbs41IxYaI
	Gz5rULvoV6IUP0yHv2VpcP/3DngaRI19jFp95Wg54kM6jkbnS9gfIldZ3revKgWCkCCjn5
	dvSyZsHI9PfbnZGnMbzk6u2+sVYhYs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-KTtg7nvJPqyRUW3qegsc7g-1; Mon, 16 Dec 2019 05:17:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 128A6800D4E;
	Mon, 16 Dec 2019 10:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2508100164D;
	Mon, 16 Dec 2019 10:16:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C4D718089C8;
	Mon, 16 Dec 2019 10:16:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBG7JBZp024970 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Dec 2019 02:19:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7580610BE396; Mon, 16 Dec 2019 07:19:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7034C10BE395
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 07:19:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3E798012BC
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 07:19:08 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-CdQ_Pf6JMyia-KWijaKd2Q-1; Mon, 16 Dec 2019 02:19:06 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 66BDCAD51559310B8857;
	Mon, 16 Dec 2019 15:19:03 +0800 (CST)
Received: from [127.0.0.1] (10.67.101.242) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Dec 2019
	15:18:54 +0800
To: <linux-crypto@vger.kernel.org>, <dm-devel@redhat.com>
From: Xu Zaibo <xuzaibo@huawei.com>
Message-ID: <7a4edfcb-c140-bf1b-c674-dbb1b30f9b07@huawei.com>
Date: Mon, 16 Dec 2019 15:18:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.242]
X-CFilter-Loop: Reflected
X-MC-Unique: CdQ_Pf6JMyia-KWijaKd2Q-1
X-MC-Unique: KTtg7nvJPqyRUW3qegsc7g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBG7JBZp024970
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Dec 2019 05:16:37 -0500
Cc: forest.zhouchang@huawei.com, zhangwei375@huawei.com
Subject: [dm-devel] [Question] Confusion of the meaning for encrypto API's
	return value
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Hi,

I get a confusion.

According to my understanding, That 'crypto_skcipher_encrypt(request)' 
returns '-EBUSY '

means the caller should call this API again with the request. However, 
as my knowledge in

'dm-crypt', this means the caller need not call this request again, 
because 'dm-crypt' thinks

that the driver of 'crypto_skcipher_encrypt' will send the request again 
as it is not busy.

    So, my question is: what's the meaning of 
'crypto_skcipher_encrypt(request)' returning '-EBUSY '?


Cheers,

Zaibo


.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

