Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9EF8487D
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 11:18:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48EC86378;
	Wed,  7 Aug 2019 09:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71E255D9E1;
	Wed,  7 Aug 2019 09:17:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81AC11800202;
	Wed,  7 Aug 2019 09:17:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x779DMxP032155 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 05:13:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9900126160; Wed,  7 Aug 2019 09:13:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC761FD3C;
	Wed,  7 Aug 2019 09:13:18 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71101C08EC28;
	Wed,  7 Aug 2019 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565169383; x=1596705383;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=61Zs1wk2E5qegjuqcc51TKR7hwdPbdWU2IpyIIMJ9hk=;
	b=plTlGzprVIPzrNZvtP6WrNGieefP+rHXSZf1xxbU1skK54aqYW95gMtl
	1jOKYi5w/wQX3UEQNEss4BceeRj+LNvMFXC5Hqz32IUd9AEoQYgRVcmKg
	uIWvdBtLa4c/n+/y3DtIodVomJQne3PQehjyd/6bhCNT9VwDs7yjB2rv3
	2vMHkxxCRc4/vkB2b+8e3limP3wcoc/zdbfpdlz5pt4QCDP/tEppd5CWZ
	vF/GHutPzsKUmbBJPwCSt0u80ciSQJ4tTE2NWL2eY/yz3cta39ghQkjUe
	ueBMPb5z/TFlqlSt5/c1QQ3ApDLQ+wgul45YkFuP1Tu6TaKpMrvayPnm9 A==;
IronPort-SDR: rXD7+3meVZ81xkfg8MZvs23xmolWj1STUh+RD7C8G2V6d9FlaM4VlnV+GngtUfCfAPVPmjjYiH
	8GF1osuD3QlS7/tJmtb9yYE6eHhFokfhjJB32KhLLgaHte9Bc+OWdf3uce/88lGDmtpV2w/Vfa
	MxBEltAHaiwoR/EOPQr0eXT/yCrWsWIjiCtua49z1DLAZ/vbZKLmAhNdiw5O8kAVIB9XRSEqCK
	4I4rsSD/xMBehJOnxrS1Hbx5z2jvu3RKD8tRa4YawREQcssR7nna5aJ+ZMrDPnJeOhtJd09kod
	tgo=
X-IronPort-AV: E=Sophos;i="5.64,357,1559491200"; d="scan'208";a="215517194"
Received: from mail-sn1nam01lp2053.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.53])
	by ob1.hgst.iphmx.com with ESMTP; 07 Aug 2019 17:15:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=f/GRZuqpmag1l69Y83vYriYMrBt+1+4WnKFEbGbFpaZKLLGiLhSTZ3lMwzVAgVaYOjdqFr6T3C7BAvd3IEPgUvZ2Qm8cWHEGGBc+p/SQ2farF9a/rsRUQXUD1A94u4jpzjeEsa5MYCOjx0ZR10izZSxUYZnlLi/jQMrx3ZcHNLbCMHfoYxDnm6sz0jI7Ov02D8pjzvfnpmutq0cLQFGI22+Gf8us9QlMn8Ou+iWeIbnNPbfCXDouV3YeswGGKdD1G6gLb7qKXPjKGvE5Tk6DOF1DM8YRTG01Ul3luj6rX9nkH5XN3rYdpMKWhxVX1ArHqRrksqSJGgAxHxk/yxqeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q9AGodYNWdG5Y0mM0XT5xduwA2AV2l06b2lhh0xxgO8=;
	b=lsXXQX3wl18vWMQBjK8cQRR3rmnCe7Hd+TaBJ2oVMXVgI45aV3FODZAIEXjkgwopAsAAUY44ZuGhy9ewhj0IR9ndGeaDvLN7vaOtt3BVcW8N9DSvnZUGKLZjKw2VWK1zeEHBw+SLUhBucz5EABLFU7lWmIacfqzzpuARJaq7sFmBSNv8rO+h/RoX35+ZNxWUzBUUqmqaFriciUpxjj2r7c92pJeYkrgP3TTNSV+wveQmxLs/vNOFsm1y71FxnhT9rNNolh1RFpnW8cEeGALFQ+DYEq2DNYqVYnKoNRqGPDSbXlMONXOc+Vro3XCZBESI880asiwG/DgB4j5L5qFuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=q9AGodYNWdG5Y0mM0XT5xduwA2AV2l06b2lhh0xxgO8=;
	b=q7IwGDbnBEm5EC+HwDrnxPZ33tbj+pVJF007ds9nVC5+VnWQ7qnEAD3mtU7bgtDwmbkF4/JM+pa5EWYao+e0fN5dQ/cHmgT61HFKLBlevMq2nvdgWcWb76uE3bDQAVe6g9RRBXhQyEPJfzW07xDlk9GBmn4GVMAg1EazC5+xTRs=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5511.namprd04.prod.outlook.com (20.178.232.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.13; Wed, 7 Aug 2019 09:12:44 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.018;
	Wed, 7 Aug 2019 09:12:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm kcopyd: always complete failed jobs
Thread-Index: AQHVS+lZIeuIcjdyeEKQKSQWAd061Q==
Date: Wed, 7 Aug 2019 09:12:43 +0000
Message-ID: <BYAPR04MB5816ECBD651A16571529695AE7D40@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190805235603.18337-1-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e760072-fa30-44e6-3d66-08d71b176810
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5511; 
x-ms-traffictypediagnostic: BYAPR04MB5511:
x-microsoft-antispam-prvs: <BYAPR04MB551173B5E7237431955A9359E7D40@BYAPR04MB5511.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(478600001)(6246003)(33656002)(6436002)(91956017)(52536014)(14454004)(76116006)(14444005)(55016002)(66946007)(256004)(64756008)(53936002)(2501003)(66446008)(476003)(66556008)(9686003)(6116002)(186003)(5660300002)(71190400001)(66066001)(71200400001)(7736002)(68736007)(66476007)(86362001)(26005)(305945005)(74316002)(81156014)(110136005)(2906002)(25786009)(446003)(316002)(99286004)(486006)(81166006)(7696005)(102836004)(3846002)(53546011)(450100002)(229853002)(8936002)(8676002)(6506007)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5511;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OqLn/T1a6bV/byXR1EDYjT1257YvzbKcRxOO3jpntvkI/bmsV+2xk4QgCJoVmvZhsfNQIvP8KaZjR63jYyaHGCyR2WunD/KFXCcLtN9dftTEz1oxJEyBY58SNGRslON+zqadjh2J4hWSCJByDSMa8bgWoVi/EkmcPnuTm6ZHj1+XYPKG1xEN7pHXUThcHppOjPEjayNsZKa+WuCGlQTIFyx1H+hu6RcBvTroPBqc/FPed8WRkpsxLXwoDF5xiW997tLG98Qe7ZW7u0Saj8DuGshcHaq0I0vkJ0BBpHcWeDDBUoAFUDy4ZhcrnKjdbY3nD7LaKOpj39XjnWr7rB1UtMA0Mrh0EXvzcXf8e/YoyD8vMwIy3+KpLGrExmD79YLVpMYOdR4yZ1TJfvHDsnnuBZDiIQotgutMC/iOFJmN8Ic=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e760072-fa30-44e6-3d66-08d71b176810
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 09:12:43.8737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5511
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Wed, 07 Aug 2019 09:13:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 07 Aug 2019 09:13:07 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com
	68.232.143.124 esa2.hgst.iphmx.com
	<prvs=1151cfe65=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x779DMxP032155
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm kcopyd: always complete failed jobs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 07 Aug 2019 09:18:04 +0000 (UTC)

On 2019/08/06 8:56, Dmitry Fomichev wrote:
> This patch fixes a problem in dm-kcopyd that may leave jobs in
> complete queue indefinitely in the event of backing storage failure.
> 
> This behavior has been observed while running 100% write file fio
> workload against an XFS volume created on top of a dm-zoned target
> device. If the underlying storage of dm-zoned goes to offline state
> under I/O, kcopyd sometimes never issues the end copy callback and
> dm-zoned reclaim work hangs indefinitely waiting for that completion.
> 
> This behavior was traced down to the error handling code in
> process_jobs() function that places the failed job to complete_jobs
> queue, but doesn't wake up the job handler. In case of backing device
> failure, all outstanding jobs may end up going to complete_jobs queue
> via this code path and then stay there forever because there are no
> more successful I/O jobs to wake up the job handler.
> 
> This patch adds a wake() call to always wake up kcopyd job wait queue
> for all I/O jobs that fail before dm_io() gets called for that job.
> 
> The patch also sets the write error status in all sub jobs that are
> failed because their master job has failed.
> 
> Fixes: b73c67c2cbb00 ("dm kcopyd: add sequential write feature")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-kcopyd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
> index df2011de7be2..1bbe4a34ef4c 100644
> --- a/drivers/md/dm-kcopyd.c
> +++ b/drivers/md/dm-kcopyd.c
> @@ -566,8 +566,10 @@ static int run_io_job(struct kcopyd_job *job)
>  	 * no point in continuing.
>  	 */
>  	if (test_bit(DM_KCOPYD_WRITE_SEQ, &job->flags) &&
> -	    job->master_job->write_err)
> +	    job->master_job->write_err) {
> +		job->write_err = job->master_job->write_err;
>  		return -EIO;
> +	}
>  
>  	io_job_start(job->kc->throttle);
>  
> @@ -619,6 +621,7 @@ static int process_jobs(struct list_head *jobs, struct dm_kcopyd_client *kc,
>  			else
>  				job->read_err = 1;
>  			push(&kc->complete_jobs, job);
> +			wake(kc);
>  			break;
>  		}
>  
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
