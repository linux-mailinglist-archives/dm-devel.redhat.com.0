Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4C96F15ADF0
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 18:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581526970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DHn9JRLCYCuUKnHOt/BTHVUO2w9gIED59o3d6g50P9c=;
	b=a54WJaqIIYRBmWLxBTrWFBw2P67H49EgpShQHsICdqeX0nn7haEa2rPbiqmrntOOW80Y1R
	jzNiv4EG1P07i/Hn2Rlxs6QBtIi0diVzhpfSPXZNUY8mqHpBqkM5zdiNvUrwRBiYMC2DfM
	cLUX4g5qKCQ+dtFHVBr2nyh+odRgoaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-Bz72QeujOxW0RBqQ66Bvzg-1; Wed, 12 Feb 2020 12:02:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7991005514;
	Wed, 12 Feb 2020 17:02:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E605863CC;
	Wed, 12 Feb 2020 17:02:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62C1D87A7F;
	Wed, 12 Feb 2020 17:02:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CH2UPD000794 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:02:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B34572166B29; Wed, 12 Feb 2020 17:02:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AECCC2166B28
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 17:02:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D3E08032AE
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 17:02:28 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-271-bdxtz_70NFOo7hb5FZRW3g-1; Wed, 12 Feb 2020 12:02:22 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01CGtOZ5090167; Wed, 12 Feb 2020 17:02:03 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 2y2jx6chpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 12 Feb 2020 17:02:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	01CGvFWA009091; Wed, 12 Feb 2020 17:02:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3020.oracle.com with ESMTP id 2y4k9g18f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2020 17:02:01 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01CH1x7Z005685;
	Wed, 12 Feb 2020 17:01:59 GMT
Received: from localhost (/10.159.151.237)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 12 Feb 2020 09:01:59 -0800
Date: Wed, 12 Feb 2020 09:01:56 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <20200212170156.GM6874@magnolia>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
	<158132724397.239613.16927024926439560344.stgit@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <158132724397.239613.16927024926439560344.stgit@localhost.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	suspectscore=0 spamscore=0
	adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002120128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9529
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
	malwarescore=0
	priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0
	spamscore=0
	bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2001150001 definitions=main-2002120128
X-MC-Unique: bdxtz_70NFOo7hb5FZRW3g-1
X-MC-Unique: Bz72QeujOxW0RBqQ66Bvzg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01CH2UPD000794
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, bob.liu@oracle.com, minwoo.im.dev@gmail.com,
	jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v6 6/6] loop: Add support for REQ_ALLOCATE
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 10, 2020 at 12:34:04PM +0300, Kirill Tkhai wrote:
> Support for new modifier of REQ_OP_WRITE_ZEROES command.
> This results in allocation extents in backing file instead
> of actual blocks zeroing.
> 
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/block/loop.c |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 739b372a5112..bfe76d9adf09 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -581,6 +581,15 @@ static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
>  	return 0;
>  }
>  
> +static unsigned int write_zeroes_to_fallocate_mode(unsigned int flags)
> +{
> +	if (flags & REQ_ALLOCATE)
> +		return 0;
> +	if (flags & REQ_NOUNMAP)
> +		return FALLOC_FL_ZERO_RANGE;
> +	return FALLOC_FL_PUNCH_HOLE;
> +}
> +
>  static int do_req_filebacked(struct loop_device *lo, struct request *rq)
>  {
>  	struct loop_cmd *cmd = blk_mq_rq_to_pdu(rq);
> @@ -604,9 +613,7 @@ static int do_req_filebacked(struct loop_device *lo, struct request *rq)
>  		 * write zeroes the range.  Otherwise, punch them out.
>  		 */

Please update this comment to reflect the new REQ_ALLOCATE mode, and
move it to where you define write_zeroes_to_fallocate_mode().

With that fixed,

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

>  		return lo_fallocate(lo, rq, pos,
> -			(rq->cmd_flags & REQ_NOUNMAP) ?
> -				FALLOC_FL_ZERO_RANGE :
> -				FALLOC_FL_PUNCH_HOLE);
> +			write_zeroes_to_fallocate_mode(rq->cmd_flags));
>  	case REQ_OP_DISCARD:
>  		return lo_fallocate(lo, rq, pos, FALLOC_FL_PUNCH_HOLE);
>  	case REQ_OP_WRITE:
> @@ -877,6 +884,7 @@ static void loop_config_discard(struct loop_device *lo)
>  		q->limits.discard_alignment = 0;
>  		blk_queue_max_discard_sectors(q, 0);
>  		blk_queue_max_write_zeroes_sectors(q, 0);
> +		blk_queue_max_allocate_sectors(q, 0);
>  		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
>  		return;
>  	}
> @@ -886,6 +894,7 @@ static void loop_config_discard(struct loop_device *lo)
>  
>  	blk_queue_max_discard_sectors(q, UINT_MAX >> 9);
>  	blk_queue_max_write_zeroes_sectors(q, UINT_MAX >> 9);
> +	blk_queue_max_allocate_sectors(q, UINT_MAX >> 9);
>  	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
>  }
>  
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

