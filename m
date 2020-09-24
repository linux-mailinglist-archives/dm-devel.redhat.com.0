Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E83F5277744
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:56:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-2Lbxyd3_PMaZ6_CA0dlFKA-1; Thu, 24 Sep 2020 12:55:33 -0400
X-MC-Unique: 2Lbxyd3_PMaZ6_CA0dlFKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F039AD52D;
	Thu, 24 Sep 2020 16:55:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96582702E7;
	Thu, 24 Sep 2020 16:55:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AECA38C7A1;
	Thu, 24 Sep 2020 16:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGtHfT020352 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:55:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DFD92028E91; Thu, 24 Sep 2020 16:55:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 885B12024508
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 16:55:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5529102F1E3
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 16:55:12 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-350-n1XJnCBrPIi-7oIHtfz8og-1; Thu, 24 Sep 2020 12:55:09 -0400
X-MC-Unique: n1XJnCBrPIi-7oIHtfz8og-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OGcv9m086702; Thu, 24 Sep 2020 16:55:05 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 33ndnusgq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 24 Sep 2020 16:55:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08OGaUTS147953; Thu, 24 Sep 2020 16:55:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 33nurwe7mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2020 16:55:04 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OGt2Vn000582;
	Thu, 24 Sep 2020 16:55:03 GMT
MIME-Version: 1.0
Message-ID: <378f445c-2136-4d17-ac2f-355b7850d28a@default>
Date: Thu, 24 Sep 2020 09:55:01 -0700 (PDT)
From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
To: Milan Broz <gmazyland@gmail.com>, Eric Biggers <ebiggers@kernel.org>, Mike
	Snitzer <snitzer@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
	<20200924051419.GA16103@sol.localdomain>
	<1c44946e-9661-16f7-1c38-32d666b55fb2@gmail.com>
In-Reply-To: <1c44946e-9661-16f7-1c38-32d666b55fb2@gmail.com>
X-Priority: 3
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0
	phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
	clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009240124
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08OGtHfT020352
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>, dm-crypt@saout.de,
	mpatocka@redhat.com, dm-devel@redhat.com,
	Ma <shirley.ma@oracle.com>, Shirley, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Milan,

> -----Original Message-----
> From: Milan Broz [mailto:gmazyland@gmail.com]
> Sent: Thursday, September 24, 2020 2:16 AM
> To: Eric Biggers <ebiggers@kernel.org>; Mike Snitzer <snitzer@redhat.com>
> Cc: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>;
> Damien.LeMoal@wdc.com; ssudhakarp@gmail.com; Martin Petersen
> <martin.petersen@oracle.com>; dm-crypt@saout.de; dm-devel@redhat.com;
> Shirley Ma <shirley.ma@oracle.com>; mpatocka@redhat.com;
> agk@redhat.com
> Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
> lengths for skcipher devices
> 
> On 24/09/2020 07:14, Eric Biggers wrote:
> > On Wed, Sep 23, 2020 at 09:27:32PM -0400, Mike Snitzer wrote:
> >> You've clearly done a nice job with these changes.  Looks clean.
> >>
> >> BUT, I'm struggling to just accept that dm-crypt needs to go to these
> >> extra lengths purely because of one bad apple usecase.
> >>
> >> These alignment constraints aren't new.  Are there other portions of
> >> Linux's crypto subsystem that needed comparable fixes in order to work
> >> with Microsfot OS initiated IO through a guest?
> >>
> >> You forecast that these same kinds of changes are needed for AEAD and
> >> dm-integrity... that's alarming.
> >>
> >> Are we _certain_ there is no other way forward?
> >> (Sorry I don't have suggestions.. I'm in "fact finding mode" ;)
> >>
> >
> > I don't understand why this is needed, since dm-crypt already sets its
> > logical_block_size to its crypto sector_size.  Isn't it expected that I/O that
> > isn't aligned to logical_block_size fails?  It's the I/O submitter's
> > responsibility to ensure logical_block_size alignment of all I/O segments.
> > Exactly how is the misaligned I/O actually being submitted here?
> 
> Thanks for mentioning it - exactly that I asked when reading this patch...
> It seems that we are here fixing a problem that is just caused when someone
> ignores clearly set restrictions.
> 
> Who is submitting these bioses? Why can it not be fixed there?
> 
> What happens with writes to fs journals, etc., is it still safe if we are
> processing such unaligned bios?

I don't follow your question regarding fs journals. I am not sure why it is not safe to process unaligned bio segment lengths of fs journals writes. Could you explain with some example on why that would be a problem?

Please see my reply to Eric's/Mike's email, in that, I explained why this issue needs to be fixed in dm-crypt. I hope I have answered to your questions there. If not, let me know, I will try to answer.

Thanks
Sudhakar

> 
> Milan


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

