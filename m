Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF985815
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 04:22:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DC31315C01F;
	Thu,  8 Aug 2019 02:22:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8775D717;
	Thu,  8 Aug 2019 02:22:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A31E11800202;
	Thu,  8 Aug 2019 02:22:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x782M8Dr022745 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 22:22:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5E96608AB; Thu,  8 Aug 2019 02:22:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD96960A97;
	Thu,  8 Aug 2019 02:22:01 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A1D981F22;
	Thu,  8 Aug 2019 02:21:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x782IO1G084078; Thu, 8 Aug 2019 02:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=to : cc : subject :
	from : references : date : in-reply-to : message-id : mime-version :
	content-type; s=corp-2018-07-02;
	bh=ACq7S8nv7dzK0UkdAc/DjZFBJLQC3vr+kzfxusPxV1A=;
	b=JByW4jwGa6f+Xwbst5KPM8rIDbegbBj7AhOUjZK4MebDLGwMcDdoPU3xUW3WCFpNGH2r
	B0LC7542OLvCigeDvVClu5FxFhy/QF57BLn9iR3GojxMB9S2zYA8SwO+Ptyz09NYB39i
	mw+Yy/rH6noS2QnTkh/9cpow8SjRCZ3NIAUkDYqFLxlD3BPj5R3wWP2TPpy8uo9Cv6m9
	S2tAVATA29SQFJm/Ji7uy5ZmpWC7G2O+Ba6ji0Aa1TUM6mNku82RpnFbQqQtivLPvFRw
	k1TB+o1dXqjECG57jOTNE3EI+Rw97jV/P264JDlW50FvSwt+rDzEk7vnQssXTnXA/DJq
	NA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2u51pu7rvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2019 02:21:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x782HTul031517; Thu, 8 Aug 2019 02:19:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2u763jjs5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2019 02:19:06 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x782J3Qu015908;
	Thu, 8 Aug 2019 02:19:03 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 07 Aug 2019 19:19:02 -0700
To: Ming Lei <tom.leiming@gmail.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190807144948.28265-1-maier@linux.ibm.com>
	<20190807144948.28265-2-maier@linux.ibm.com>
	<CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
Date: Wed, 07 Aug 2019 22:18:59 -0400
In-Reply-To: <CACVXFVM0tFj8CmcHON04_KjxR=QErCbUx0abJgG2W9OBb7akZA@mail.gmail.com>
	(Ming Lei's message of "Thu, 8 Aug 2019 07:32:29 +0800")
Message-ID: <yq136iccsbw.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1908080022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1908080022
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Thu, 08 Aug 2019 02:21:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 08 Aug 2019 02:21:57 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'martin.petersen@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <martin.petersen@oracle.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	Linux SCSI List <linux-scsi@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Hannes Reinecke <hare@suse.com>, "Ewan D . Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block <linux-block@vger.kernel.org>,
	"open list:DEVICE-MAPPER \(LVM\)" <dm-devel@redhat.com>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Paolo Bonzini <pbonzini@redhat.com>, Steffen Maier <maier@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 1/2] scsi: core: fix missing .cleanup_rq for
	SCSI hosts without request batching
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 08 Aug 2019 02:22:26 +0000 (UTC)


Ming,

>> +       .cleanup_rq     = scsi_cleanup_rq,
>>         .busy           = scsi_mq_lld_busy,
>>         .map_queues     = scsi_map_queues,
>>  };
>
> This one is a cross-tree thing, either scsi/5.4/scsi-queue needs to
> pull for-5.4/block, or do it after both land linus tree.

I'll set up an amalgamated for-next branch tomorrow.

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
