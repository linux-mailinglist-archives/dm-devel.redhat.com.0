Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id E7291192E33
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 17:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585153686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=atfSvn2BRE9CN8EXBel2JZ6niwjgm5gzvUH29NsqRRI=;
	b=c68NFVzVorpXZ7yM3UFycApN2W8L56EamtBy0mcSEJEmhs5X8q7oxzgURrJH4kwDcXUd+X
	Aix3bAIGGrEqzRwExddfwHHivPH+CmJPrYOVZvEUaQJetcffTC6exrywSj+lTK1JfFnMjy
	bNie72pJKBrf3z7cAQz2huV2LNCd5sI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-Qf_ZUOzbMEGTfPJCI9Hpew-1; Wed, 25 Mar 2020 12:28:03 -0400
X-MC-Unique: Qf_ZUOzbMEGTfPJCI9Hpew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F1D885EE6E;
	Wed, 25 Mar 2020 16:27:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6013960BE0;
	Wed, 25 Mar 2020 16:27:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F18E18089C8;
	Wed, 25 Mar 2020 16:27:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PGRVMj014588 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 12:27:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 685242166B2C; Wed, 25 Mar 2020 16:27:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 647A92166B2A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 16:27:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA3B6101A55A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 16:27:28 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-nFqAOmboNPybaolbZSyvUA-1; Wed, 25 Mar 2020 12:27:23 -0400
X-MC-Unique: nFqAOmboNPybaolbZSyvUA-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02PGIHAl040559; Wed, 25 Mar 2020 16:27:05 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 3005kv9sw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2020 16:27:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02PGLqh9185365; Wed, 25 Mar 2020 16:27:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 3006r6v7a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2020 16:27:04 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02PGQxmx024402;
	Wed, 25 Mar 2020 16:27:00 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 25 Mar 2020 09:26:59 -0700
Date: Wed, 25 Mar 2020 09:26:56 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200325162656.GJ29351@magnolia>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org> <yq1tv2k8pjn.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1tv2k8pjn.fsf@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9571
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	adultscore=0 suspectscore=0
	phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003250131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9571
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	bulkscore=0 phishscore=0
	suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
	priorityscore=1501
	mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1011
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003250130
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PGRVMj014588
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	Christoph Hellwig <hch@infradead.org>, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
	dsterba@suse.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 19, 2020 at 09:03:40AM -0400, Martin K. Petersen wrote:
> 
> Christoph,
> 
> >> Some comments? Some requests for reworking? Some personal reasons to
> >> ignore my patches?
> >
> > I'm still completely opposed to the magic overloading using a flag.
> > That is just a bad design waiting for trouble to happen.
> 
> The observation was that Kirill's original patch set was a line-for-line
> carbon copy of the write zeroes handling throughout the stack. The only
> difference between the two was at the bottom. Instead of duplicating all
> that code it seemed cleaner to use shared plumbing since these
> operations need to be split and merged exactly the same way in the block
> layer.
> 
> Also, we already have REQ_NOUNMAP, not sure why an additional handling
> flag would lead to trouble? Note that I suggested renaming
> REQ_OP_WRITE_ZEROES to something else to separate the semantics from the
> plumbing.
> 
> We need to be able to express:
> 
>  - zero & allocate block range (REQ_OP_WRITE_ZEROES, REQ_NOUNMAP)
>  - zero & deallocate block range (REQ_OP_WRITE_ZEROES, !REQ_NOUNMAP)
>  - allocate block range (?, don't care about zeroing)
>  - deallocate block range (REQ_OP_DISCARD, don't care about zeroing)
> 
> It just seems like a full-fledged REQ_OP_ALLOCATE is an overkill to fill
> that gap.
> 
> That said, I do think that we have traditionally put emphasis on the
> wrong part of these operations. All we ever talk about wrt. discard and
> friends is the zeroing aspect. But I actually think that, semantically,
> the act of allocating and deallocating blocks is more important. And
> that zeroing is an optional second order effect of those operations. So
> if we could go back in time and nuke multi-range DSM TRIM/UNMAP, I would
> like to have REQ_OP_ALLOCATE/REQ_OP_DEALLOCATE with an optional REQ_ZERO
> flag. I think that would be cleaner. I have a much easier time wrapping
> my head around "allocate this block and zero it if you can" than "zero
> this block and do not deallocate it". But maybe that's just me.

I'd love to transition to that.  My brain is not good at following all
the inverse logic that NOUNMAP spread everywhere.  I have a difficult
time following what the blockdev fallocate code does, which is sad since
hch and I are the primary stuckees^Wmeddlers^Wauthors of that function. :/

--D

> -- 
> Martin K. Petersen	Oracle Linux Engineering


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

