Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id ED504192F21
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 18:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585157100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eyClLcVM4k05Ur24ve58uMpYAwH9sXPLy++AdHQ4JZg=;
	b=b+ys1qPwB9AxYOPZ4U/hcojRUpSNuN9a6AFRNGhVGDEdlwH4TO3KM5T0iFumonnu16Kwy9
	0N0DEGvCaPP/aVj1XHCNljEC5qDxRhU+wV3r3GWPLY9810s81TIVgl9009EUBxif5DgGQV
	VoSTyh61THLqpuSechnDUHZIPmVMn9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-V3ld1YtMPT-oKhVLfp2cqQ-1; Wed, 25 Mar 2020 13:24:58 -0400
X-MC-Unique: V3ld1YtMPT-oKhVLfp2cqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 914141005509;
	Wed, 25 Mar 2020 17:24:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBDBB7E311;
	Wed, 25 Mar 2020 17:24:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C124586392;
	Wed, 25 Mar 2020 17:24:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PHOXeh016661 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 13:24:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C6D82166B2B; Wed, 25 Mar 2020 17:24:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A762166B2A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 17:24:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B35D8F782B
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 17:24:31 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-VDyRwba7OMW7ezmzPJcD2g-1; Wed, 25 Mar 2020 13:24:28 -0400
X-MC-Unique: VDyRwba7OMW7ezmzPJcD2g-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02PHIUu9063725; Wed, 25 Mar 2020 17:23:45 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 3005kva3e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2020 17:23:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02PHMVh7021581; Wed, 25 Mar 2020 17:23:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 2yxw4rvfvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2020 17:23:44 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02PHNepp026829;
	Wed, 25 Mar 2020 17:23:40 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 25 Mar 2020 10:23:40 -0700
To: Christoph Hellwig <hch@infradead.org>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org> <yq1tv2k8pjn.fsf@oracle.com>
	<20200325162656.GJ29351@magnolia>
	<20200325163223.GA27156@infradead.org>
Date: Wed, 25 Mar 2020 13:23:33 -0400
In-Reply-To: <20200325163223.GA27156@infradead.org> (Christoph Hellwig's
	message of "Wed, 25 Mar 2020 09:32:23 -0700")
Message-ID: <yq1d090jqlm.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9571
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=0
	spamscore=0 mlxlogscore=786 adultscore=0 phishscore=0 mlxscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003250140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9571
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	bulkscore=0 phishscore=0
	suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
	priorityscore=1501
	mlxlogscore=841 lowpriorityscore=0 mlxscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003250139
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PHOXeh016661
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	"Darrick J. Wong" <darrick.wong@oracle.com>, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
	dsterba@suse.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Christoph,

> I am very much against that for the following reason:
>
>  - the current REQ_OP_DISCARD is purely a hint, and implementations can
>    (and do) choose to ignore it
>
>  - REQ_OP_WRITE_ZEROES is an actual data integrity operation with
>    everything that entails

If you want to keep emphasis on the "integrity operation" instead of the
provisioning aspect, would you expect REQ_ALLOCATE (which may or may not
zero blocks) to be considered a deterministic operation or a
non-deterministic one? Should this depend on whether the device
guarantees zeroing when provisioning blocks or not?

-- 
Martin K. Petersen	Oracle Linux Engineering


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

