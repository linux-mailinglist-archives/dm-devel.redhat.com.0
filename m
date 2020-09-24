Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E835127785B
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 20:17:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-nxqbaB7ZOk2vc3KQnlISyg-1; Thu, 24 Sep 2020 14:17:19 -0400
X-MC-Unique: nxqbaB7ZOk2vc3KQnlISyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6C311DE07;
	Thu, 24 Sep 2020 18:17:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C18B73693;
	Thu, 24 Sep 2020 18:17:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B7B644A5E;
	Thu, 24 Sep 2020 18:17:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OIC7WU028954 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 14:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E817115DEB; Thu, 24 Sep 2020 18:12:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E9B115DED
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 18:12:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E57858287
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 18:12:05 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-376-L3CVGEhmOlWByJipybDM4A-1; Thu, 24 Sep 2020 14:12:02 -0400
X-MC-Unique: L3CVGEhmOlWByJipybDM4A-1
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OIA2j1102666; Thu, 24 Sep 2020 18:11:59 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2130.oracle.com with ESMTP id 33qcpu6ra3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Sep 2020 18:11:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OIACdt050302; Thu, 24 Sep 2020 18:11:58 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3020.oracle.com with ESMTP id 33r28xanrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2020 18:11:58 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OIBu1L013244;
	Thu, 24 Sep 2020 18:11:56 GMT
MIME-Version: 1.0
Message-ID: <fd512a7d-c064-4812-a794-5274c10687db@default>
Date: Thu, 24 Sep 2020 11:11:55 -0700 (PDT)
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: Mikulas Patocka <mpatocka@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<252587bb-c0b7-47c9-a97b-91422f8f9c47@default>
	<alpine.LRH.2.02.2009241314280.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<7b6fdfd5-0160-4bcf-b7ed-d0e51553c678@default>
	<alpine.LRH.2.02.2009241345370.4229@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2009241345370.4229@file01.intranet.prod.int.rdu2.redhat.com>
X-Priority: 3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	mlxlogscore=999
	suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	mlxlogscore=999
	adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
	priorityscore=1501
	phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240133
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OIC7WU028954
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Mike Snitzer <snitzer@redhat.com>, dm-crypt@saout.de,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	Shirley Ma <shirley.ma@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Milan Broz <gmazyland@gmail.com>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> By copying it to a temporary aligned buffer and issuing I/O on this
> buffer.

I don't like this idea. Because, you need to allocate additional pages for the entire I/O size(for the misaligned case, if you think through carefully, you will know why we have to allocate a temporary buffer that is as big as the original IO) and on top of it, copying the buffer from original to temporary buffer which is all unnecessary while it can simply be fixed in dm-crypt without any of these additional overheads.

> 
> > Only other
> > possibility I see is to have windows fix it by always sending 512 byte
> > aligned buffer lengths, but going with my earlier point that every other
> > component in the Linux IO path handles this case well except for
> > dm-crypt, so it make more sense to fix it in dm-crypt.
> >
> > Thanks
> > Sudhakar
> 
> Are you sure that the problem is only with dm-crypt? You haven't tried all
> the existing block device drivers, have you?

My question is, why dm-crypt worries about alignment requirement of other layers? Is there anything that impacts dm-crypt if the segment lengths are not aligned?(I believe this case is just not handled so far in dm-crypt and my patch addresses it). Should dm-crypt not just pass on all those I/O requests to those respective layers to handle it which will be more graceful?

-Sudhakar

> 
> Mikulas
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

