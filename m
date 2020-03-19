Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 8834818B3E5
	for <lists+dm-devel@lfdr.de>; Thu, 19 Mar 2020 14:05:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584623111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u3z5nnbjSTmkGm6WF7A5dMw9xJdNVcj5TVpB/fAwToU=;
	b=UNB49/iRssvPXpVFfNh/9GeSxBkE8aFZZC0+zKU27OB1v/gQXc05pzZxMbdiUpBtCXXtCo
	wDH/CMYNMmEgrkAy+4pgkzhRFTiHPPLS1S6dxoEy2A2m9MD8Qj9aEbBUFyu3Yj9GQObfM1
	qEz+zHLi6bgc3iOAMC/36WCeY009lu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457--VQ9mTdJMn-fvik4kQNlfA-1; Thu, 19 Mar 2020 09:05:09 -0400
X-MC-Unique: -VQ9mTdJMn-fvik4kQNlfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 005061005510;
	Thu, 19 Mar 2020 13:05:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A64B19C58;
	Thu, 19 Mar 2020 13:04:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E35F1809565;
	Thu, 19 Mar 2020 13:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02JD4VVc006594 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Mar 2020 09:04:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3FB3103260A; Thu, 19 Mar 2020 13:04:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF29103260D
	for <dm-devel@redhat.com>; Thu, 19 Mar 2020 13:04:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E26D8F68E4
	for <dm-devel@redhat.com>; Thu, 19 Mar 2020 13:04:29 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-BePuNbhpOYuPjEUoE7mrvQ-1; Thu, 19 Mar 2020 09:04:27 -0400
X-MC-Unique: BePuNbhpOYuPjEUoE7mrvQ-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02JCm67j104557; Thu, 19 Mar 2020 13:03:51 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2yub278093-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Mar 2020 13:03:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02JCohiE179280; Thu, 19 Mar 2020 13:03:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 2ys9040cm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Mar 2020 13:03:50 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02JD3kap006935;
	Thu, 19 Mar 2020 13:03:46 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 19 Mar 2020 06:03:45 -0700
To: Christoph Hellwig <hch@infradead.org>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org>
Date: Thu, 19 Mar 2020 09:03:40 -0400
In-Reply-To: <20200319102819.GA26418@infradead.org> (Christoph Hellwig's
	message of "Thu, 19 Mar 2020 03:28:19 -0700")
Message-ID: <yq1tv2k8pjn.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	mlxlogscore=835 mlxscore=0
	adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003190058
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	impostorscore=0
	mlxlogscore=896 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
	clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003190058
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02JD4VVc006594
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	darrick.wong@oracle.com, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
	dsterba@suse.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu, martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag
	for REQ_OP_WRITE_ZEROES
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Christoph,

>> Some comments? Some requests for reworking? Some personal reasons to
>> ignore my patches?
>
> I'm still completely opposed to the magic overloading using a flag.
> That is just a bad design waiting for trouble to happen.

The observation was that Kirill's original patch set was a line-for-line
carbon copy of the write zeroes handling throughout the stack. The only
difference between the two was at the bottom. Instead of duplicating all
that code it seemed cleaner to use shared plumbing since these
operations need to be split and merged exactly the same way in the block
layer.

Also, we already have REQ_NOUNMAP, not sure why an additional handling
flag would lead to trouble? Note that I suggested renaming
REQ_OP_WRITE_ZEROES to something else to separate the semantics from the
plumbing.

We need to be able to express:

 - zero & allocate block range (REQ_OP_WRITE_ZEROES, REQ_NOUNMAP)
 - zero & deallocate block range (REQ_OP_WRITE_ZEROES, !REQ_NOUNMAP)
 - allocate block range (?, don't care about zeroing)
 - deallocate block range (REQ_OP_DISCARD, don't care about zeroing)

It just seems like a full-fledged REQ_OP_ALLOCATE is an overkill to fill
that gap.

That said, I do think that we have traditionally put emphasis on the
wrong part of these operations. All we ever talk about wrt. discard and
friends is the zeroing aspect. But I actually think that, semantically,
the act of allocating and deallocating blocks is more important. And
that zeroing is an optional second order effect of those operations. So
if we could go back in time and nuke multi-range DSM TRIM/UNMAP, I would
like to have REQ_OP_ALLOCATE/REQ_OP_DEALLOCATE with an optional REQ_ZERO
flag. I think that would be cleaner. I have a much easier time wrapping
my head around "allocate this block and zero it if you can" than "zero
this block and do not deallocate it". But maybe that's just me.

-- 
Martin K. Petersen	Oracle Linux Engineering


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

