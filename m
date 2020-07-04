Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C4B8A214437
	for <lists+dm-devel@lfdr.de>; Sat,  4 Jul 2020 07:35:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-FXq4O82zM0eRB4gbPajvnQ-1; Sat, 04 Jul 2020 01:35:26 -0400
X-MC-Unique: FXq4O82zM0eRB4gbPajvnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0507A8015CE;
	Sat,  4 Jul 2020 05:35:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 900CA5DAB0;
	Sat,  4 Jul 2020 05:35:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DC796C9C6;
	Sat,  4 Jul 2020 05:35:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0645Vvw8016461 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 4 Jul 2020 01:31:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FD22200ACC5; Sat,  4 Jul 2020 05:31:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9D0218ADC4
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 05:31:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51C858007AC
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 05:31:54 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-134-79Jted9yMkGfHBxsRNJubQ-1; Sat, 04 Jul 2020 01:31:52 -0400
X-MC-Unique: 79Jted9yMkGfHBxsRNJubQ-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0643IE0v056401; Sat, 4 Jul 2020 03:29:01 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 322hqm00bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Sat, 04 Jul 2020 03:29:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	0643Cwiw082610; Sat, 4 Jul 2020 03:29:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 322ft93j7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 04 Jul 2020 03:29:00 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0643SocQ028543;
	Sat, 4 Jul 2020 03:28:50 GMT
Received: from localhost (/10.159.135.37)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sat, 04 Jul 2020 03:28:50 +0000
Date: Fri, 3 Jul 2020 20:28:46 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200704032846.GU7625@magnolia>
References: <20200704032020.21923-1-rdunlap@infradead.org>
	<20200704032020.21923-14-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200704032020.21923-14-rdunlap@infradead.org>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9671
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
	mlxscore=0
	malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2007040023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9671
	signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
	adultscore=0 clxscore=1011
	priorityscore=1501 phishscore=0 mlxlogscore=999 cotscore=-2147483648
	bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=1
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2007040023
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-nfs@vger.kernel.org,
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	cgroups@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-media@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 13/13] Documentation/admin-guide: xfs: drop
	doubled word
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 03, 2020 at 08:20:20PM -0700, Randy Dunlap wrote:
> Drop the doubled word "for".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Darrick J. Wong <darrick.wong@oracle.com>
> Cc: linux-xfs@vger.kernel.org

Looks good to me,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  Documentation/admin-guide/xfs.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/admin-guide/xfs.rst
> +++ linux-next-20200701/Documentation/admin-guide/xfs.rst
> @@ -133,7 +133,7 @@ When mounting an XFS filesystem, the fol
>  	logbsize must be an integer multiple of the log
>  	stripe unit configured at **mkfs(8)** time.
>  
> -	The default value for for version 1 logs is 32768, while the
> +	The default value for version 1 logs is 32768, while the
>  	default value for version 2 logs is MAX(32768, log_sunit).
>  
>    logdev=device and rtdev=device

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

